package chap04;

import jakarta.servlet.http.*;

public class CookieUtil {

	public static void setCookie(HttpServletResponse resp, String name, String value, int expire_date, String domain) {
		Cookie cookie = new Cookie(name, value);
		cookie.setPath(domain);
		cookie.setMaxAge(expire_date); // maxAge를 안주면 0과 동일
		resp.addCookie(cookie);
	}

	public static String getCookieValue(HttpServletRequest req, String name) {
		String value = "";
		Cookie[] cookies = req.getCookies();
		for (Cookie c : cookies) {
			String cookieName = c.getName();
			String cookieVal = c.getValue();
			if (name.equals(cookieName)) {
				value = cookieVal;
				break;
			}
		}
		return value;
	}

	
	 public static void setDeleteCookie(HttpServletResponse resp, String name, String path) {
		 setCookie(resp, name, "",0, path);
	 }
	 

}
