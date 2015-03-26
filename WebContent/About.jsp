<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head link href="css/bootstrap.min.css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-responsive.min.css" rel="stylesheet">
<title>DiscussAppWeb</title>
<style type="text/css">
body {
background-image: img/bg2.jpg ;
background-attachment:fixed;
background-repeat: no-repeat; }
</style>
</head>
<body background="img/bg2.jpg" >
<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/header.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 
       <tr>
       		<td><ul class="nav nav-tabs">
  			<li role="presentation" class="active"><a href="home.jsp">หน้าหลัก</a></li>
  			<li role="presentation"><a href="About.jsp">เกี่ยวกับเรา</a></li>
 			<li role="presentation"><a href="Contact.jsp">ติดต่อเรา</a></li>
 			<p align = "right" ><Font Size=2><a href="register.jsp">&nbsp;&nbsp;สมัครสมาชิก</a>&nbsp;<a href="login.jsp">&nbsp;&nbsp;เข้าสู่ระบบ</a></Font></p> 		
			</ul></td>
       </tr>
        <tr>
           <td><p1><p align="left"><Font Size=3> เกี่ยวกับ <br> 
                             <dd>  ระบบสนทนาและการซื้อขายบนระบบแอนดรอยด์แอปพลิเคชั่น<br>
        						 DiscussApp : Application for discussion and marketing on Android</dd></Font></p></p1>
        						<p align="left"><Font Size=3><p1> <br> 
	 							<dd> ในปัจจุบันนี้ มีการใช้ Smart phone เข้ามามีบทบาทในชีวิตประจำวันเพิ่มมากขึ้น ผู้คนส่วนใหญ่ให้ความสำคัญกับสังคม 
	 							ออนไลน์โดยมีโทรศัพท์ </dd>เคลื่อนที่เป็นสื่อกลาง  และมีอัตราเพิ่มขึ้นอย่างรวดเร็ว ในยุคที่มีอินเทอร์เน็ตเป็นที่นิยมและได้รับการพัฒนาอย่างไม่หยุดนิ่งจากการพัฒนา
	 							ของโลกโซเชียลเน็ตเวิร์ค สังคมออนไลน์เป็นสังคมที่ผู้คนสามารถร่วมกันแบ่งปันสิ่งที่สนใจและการซื้อขายแลกเปลี่ยนสินค้าเป็นจำนวนมากจึงเล็งเห็นว่าการใช้งาน
	 							ส่วนใหญ่มีการใช้โทรศัพท์เคลื่อนที่ระบบ  Andriod ในการท่องโซเชียลเน็ตเวิร์ด
								<dd> <br> จากการที่ได้ศึกษาและเป็นหนึ่งในผู้ใช้โซเชียลเน็ตเวิร์ดในการเข้าใช้เว็บประเภท Discuss หรือเว็บ ซื้อขายแลกเปลี่ยนสินค้า
								และความรู้ในช่องทาง</dd>โทรศัพท์เคลื่อนที่ซึ่งการเข้าใช้เว็บดังกล่าวมีความยุ่งยากในการใช้งานเนื่องจากความคิดเห็นมีขนาดเล็กหรือใหญ่เกินไปทำให้ไม่เหมาะสมกับการใช้โทรศัพท์เคลื่อนที่ในการในเข้าใช้งาน
								 <dd><br>จึงมีการคิดริเริ่มที่จะพัฒนาระบบ Discuss Web application ขึ้นเพื่อแก้ไขปัญหาซึ่งจะแบ่งออกเป็น       2 รูปแบบ รูปแบบที่หนึ่งใช้
								งานในระบบ</dd>คอมพิวเตอร์ รูปแบบที่สองใช้งานในโทรศัพท์เคลื่อนที่ระบบ  Android ทั้งสองระบบจะมีความสัมพันธ์กันอย่างสอดคล้องเพื่อให้สะดวกมีการใช้งานหลากหลายมากขึ้นจากเดิมและทุกคนที่เข้า
								ใช้งานจะมีระบบจัดการเป็นของตนเอง
        						</p1> </Font>
        
        
                             </p></td>
        
        </tr>
       


</table></center>

<center><table background="img/bgtb.png"  border="1" bordercolor="white" cellpadding="10" cellspacing="0" style="width: 80%; " >
	  <tr>
           <td> <center> <img src="img/below1.png" width="100%" height="100%" align="middle" /></center></td>
      </tr> 

</table></center>


<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>