package net.loyin.jfinal.model;

import java.util.Stack;

/**
 * id生成器
 * @author loyin 龙影
 *
 *2013-6-15
 */
public class IdGenerater {
	private static String s="0caGdIJKbSefg6T7k1ljNXst8qQUvx23yBw9zAEruFnPWC5DLhM4OYoZVmipHR";//"0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ";
	/*public static void main(String[] args) {
		IdGenerater d=new IdGenerater();
		System.out.println(d.to10("Z00"));
			for(int i=0;i<1000;i++){
			String ss=d.to62(Long.parseLong(i+""));
			System.out.println(i+"  to62==>"+ss);
			System.out.println("to10==>"+d.to10(ss));
			}
	}*/
	/**
	 * 转换62位字符
	 * @param val
	 * @return
	 */
	public String to62(Long val){
		return toX(val,62);
	}
	/***
	 * 62进制转换Long
	 * @param val
	 * @return
	 */
	public Long to10(String val){
		if(val==null||"".equals(val)){
			return null;
		}
		Double sum=0D;
		char[] clist=val.toCharArray();
		int i=0;
		int len=clist.length;
		for(char c:clist){
			int cat=0;
			cat=s.indexOf(c);
			sum=sum+cat*Math.pow(62, (len-i-1));
			i++;
		}
		return sum.longValue();
	}
	
	/** 
     * 将数转为任意进制 
     * @param num 
     * @param base 进制
     * @return 
     */  
    public String toX(Long num,int base){  
      /*  if(base > 16){  
            throw new RuntimeException("进制数超出范围，base<=16");  
        }  */
        StringBuffer str = new StringBuffer();  
        Stack<Character> st = new Stack<Character>();  
        while(num != 0){  
            st.push(s.charAt((int) (num%base)));  
            num/=base;  
        }  
        while(!st.isEmpty()){  
            str.append(st.pop());  
        }  
        String s= str.toString();
        if(s.isEmpty()||"".equals(s)){
        	return "0";
        }
        return s;
    }  
    /** 
     * 16进制内任意进制转换 
     * @param num 
     * @param srcBase 
     * @param destBase 
     * @return 
     */  
    /*public static String baseNum(String num,int srcBase,int destBase){  
        if(srcBase == destBase){  
            return num;  
        }  
        String digths = "0123456789ABCDEF";  
        char[] chars = num.toCharArray();  
        int len = chars.length;  
        if(destBase != 10){//目标进制不是十进制 先转化为十进制  
            num = baseNum(num,srcBase,10);  
        }else{  
            int n = 0;  
            for(int i = len - 1; i >=0; i--){  
                n+=digths.indexOf(chars[i])*Math.pow(srcBase, len - i - 1);  
            }  
            return n + "";  
        }  
        return to62(Long.valueOf(num),destBase);  
    }  */
}
