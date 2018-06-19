package com.buy.pojo;

/**
 * @author admin
 *
 */
public class NormalResult {
	private int status ;
	private Object data;
	private Object msg;

	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	public Object getMsg() {
		return msg;
	}
	public void setMsg(Object msg) {
		this.msg = msg;
	}
	
	public  NormalResult (int status,Object data, Object msg) {
		this.status=status;
		this.data=data;
		this.msg=msg;
	}
	public static NormalResult OK(Object data,Object msg) {
		return new NormalResult(200, data, msg);
	}
	public static NormalResult OK(Object msg) {
		return new NormalResult(200, "", msg);
	}
	public static NormalResult Error(Object data,Object msg) {
		return new NormalResult(500, data, msg);
	}
	public static NormalResult Error(Object msg) {
		return new NormalResult(500, "", msg);
	}

}
