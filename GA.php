<?php

class GA
{
	public $codeLength = 6;

	public $chars = [
		'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H',
		'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P',
		'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X',
        'Y', 'Z', '2', '3', '4', '5', '6', '7',
        '='
	];

	// 创建秘钥
	public function createSecret($length = 16)
	{
		$secret = '';
		$rnd = false;

		if (function_exists('random_bytes')) {
			$rnd = random_bytes($length);
		} elseif (function_exists('mcrypt_create_iv')) {
			$rnd = mcrypt_create_iv($length, MCRYPT_DEV_URANDOM);
		} elseif (function_exists('openssl_random_pseudo_bytes')) {
			$rnd = openssl_random_pseudo_bytes($length, $cryptoStrong);
			if (!$cryptoStrong) {
				$rnd = false;
			}
		}

		if ($rnd != false) {
			for ($i = 0; $i < $length; ++$i) {
                $secret .= $this->chars[ord($rnd[$i]) & 31];
            }
		}

		return $secret;
	}

	// 取得code
	public function getCode($secret, $timeSlice = null)
	{
		if ($timeSlice == null) {
			$timeSlice = floor(time() / 30);
		}
		
		$secretKey = $this->base32Decode($secret);

		$time = chr(0) . chr(0) . chr(0) . chr(0) . pack('N*',$timeSlice);

		$hm = hash_hmac('SHA1', $time, $secretKey, true);

		$offset = ord(substr($hm, -1)) & 0x0F;

		$hashpart = substr($hm, $offset, 4);

		$value = unpack('N', $hashpart);
		$value = $value[1];

		$value = $value & 0x7FFFFFFF;

		$modulo = pow(10, $this->codeLength);

		return str_pad($value % $modulo, $this->codeLength, '0', STR_PAD_LEFT);
	}
	
	private function base32Decode($secret)
	{
		if (!$secret) {
			return false;
		}

		$baseChars = $this->chars;
		$flippedChars = array_flip($baseChars);

		$paddingCharCount = substr_count($secret, $baseChars[32]);
		$allowedValues = [6, 4, 3, 1, 0];

		if (!in_array($paddingCharCount, $allowedValues)) {
			return false;
		}

		for ($i=0; $i < 4; $i++) { 
			if ($paddingCharCount == $allowedValues[$i] &&
				substr($secret, -($allowedValues[$i])) != str_repeat($baseChars[32], $allowedValues[$i])
			) {
				return false;
			}
		}

		$secret = str_replace('=', '', $secret);
		$secret = str_split($secret);
		$binaryString = '';
		for ($i=0; $i < count($secret); $i+=8) { 
			$x = '';
			if (!in_array($secret[$i], $baseChars)) {
				return false;
			}

			for ($j=0; $j < 8; $j++) { 
				$x .= str_pad(base_convert($flippedChars[$secret[$i + $j]], 10, 2), 5, '0', STR_PAD_LEFT);
			}
			$eightBits = str_split($x, 8);
			for ($z=0; $z < count($eightBits); $z++) { 
				$binaryString .= (($y = chr(base_convert($eightBits[$z], 2, 10))) || ord($y) == 48) ? $y : '';
			}
		}
		return $binaryString;
	}

	// 生成google二维码
	public function getQRCodeUrl($name, $secret, $title, $params=[])
	{
		$width = 200;
		$height = 200;
		$level = 'M';
		$urlencoded = urlencode('otpauth://totp/' . $name . '?secret='.$secret);
		if ($title) {
			$urlencoded .= urlencode('&issuer='.urlencode($title));
		}

		return 'https://chart.google.com/chart?chs='.$width.'x'.$height.'&chld='.$level.'|0&cht=qr&chl='.$urlencoded;
	}

	// 判断code是否相等
	public function verifyCode($secret, $code, $discrepancy = 1, $timeSlice = null)
	{
		if ($timeSlice == null) {
			$timeSlice = floor(time() / 30);
		}

		if (strlen($code) != 6) {
			return false;
		}

		for ($i=-$discrepancy; $i <= $discrepancy; $i++) { 
			$calcedCode = $this->getCode($secret, $timeSlice + $i);
			if ($this->timeSafeEqual($calcedCode, $code)) {
				return true;
			}
		}

		return false;
	}
	
	private function timeSafeEqual($safeString, $userString)
	{
		if (function_exists('hash_equals')) {
			return hash_equals($safeString, $userString);
		}

		$safeLenght = strlen($safeString);
		$userLenght = strlen($userString);

		if ($userLenght != $safeLenght) {
			return false;
		}

		$result = 0;
		for ($i=0; $i < $userLenght; $i++) { 
			$result |= (ord($safeString[$i]) ^ ord($userString[$i]));
		}

		return $result === 0;
	}

	// 设置code长度
	public function setCodeLength($length) {
		$this->codeLength = $length;
		return $this;
	}
}