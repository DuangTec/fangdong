package com.fangdong.common.exception;

public class SQLConnectionFailException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public SQLConnectionFailException(String msg){
		super(msg);
	}
}
