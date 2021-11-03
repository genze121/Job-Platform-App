package com.helper;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.SecretKeySpec;

public class PasswordEncDec {

	private static SecretKeySpec secretKeySpec;
	private static byte[] key;
	private static final String ALGORITHM = "AES";

	public void prepareKey(String mkey) {
		MessageDigest digest = null;
		try {
			key = mkey.getBytes(StandardCharsets.UTF_8);
			digest = MessageDigest.getInstance("SHA-1");
			key = digest.digest(key);
			key = Arrays.copyOf(key, 16);
			secretKeySpec = new SecretKeySpec(key, ALGORITHM);
		} catch (NoSuchAlgorithmException e) {
			System.out.println("Error while preparing key " + e.getMessage());
		}
	}

	public String encode(String encrypt, String secret) {
		prepareKey(secret);
		try {
			Cipher ecipher = Cipher.getInstance(ALGORITHM);
			ecipher.init(Cipher.ENCRYPT_MODE, secretKeySpec);
			return Base64.getEncoder().encodeToString(ecipher.doFinal(encrypt.getBytes("UTF-8")));
		} catch (Exception e) {
			System.out.println("Error while encrypting" + e.getMessage());
		}

		return null;
	}

	public String decode(String decrypt, String secret) {
		prepareKey(secret);
		try {
			Cipher dcipher = Cipher.getInstance(ALGORITHM);
			dcipher.init(Cipher.DECRYPT_MODE, secretKeySpec);
			return new String(dcipher.doFinal(Base64.getDecoder().decode(decrypt)));
		} catch (Exception e) {
			System.out.println("Error while decrypting" + e.getMessage());
		}

		return null;
	}

}
