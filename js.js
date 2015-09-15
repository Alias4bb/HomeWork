
 function check(){
				var a=document.getElementById("inputusername").value;
				var b=document.getElementById("inputpassword").value;
				if(a==""){
                  swal("用户名为空","","error");
                  
                   return false;
                  }
                 if(b==""){

                  swal("密码不能为空","","error");
                  
                  return false;
                 }
                return true;
				}
			
			function reload(){
				window.location.reload();
			}
    //该函数用于创建一个XMLHttpRequest对象
      function createXMLHttpRequest() {
         if (window.ActiveXObject) 
           xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
         else if (window.XMLHttpRequest) 
           xmlHttp = new XMLHttpRequest();
      }
      //这是一个启动AJAX异步通信的方法
      function show(str){

         createXMLHttpRequest();//创建一个XMLHttpRequest对象
         xmlHttp.onreadystatechange = processor; //将状态触发器绑定到一个函数
         //通过GET方法向指定的URL建立服务器的调用
         xmlHttp.open("GET", "CheckUser?username="+str);
         xmlHttp.send(null); //发送请求
      }
      //这是一用来处理状态改变的函数
      function processor () {
         //定义一个变量用于存放从服务器返回的响应结果
         var responseContext;
         if(xmlHttp.readyState == 4) { //如果响应完成
           if(xmlHttp.status == 200) {//如果返回成功
             //取出服务器的响应内容
             responseContext = xmlHttp.responseText;
           if(responseContext.indexOf("true")!=-1){
            
               document.getElementById("x").innerHTML="用户名可以使用";
               document.getElementById("x").className="alert alert-info";
                 document.getElementById("m").className="glyphicon glyphicon-ok-sign form-control-feedback";


           }

           else{
            document.getElementById("x").innerHTML="用户名已经被注册";
              document.getElementById("x").className="alert alert-danger";
              document.getElementById("m").className="glyphicon glyphicon-remove-sign form-control-feedback";
           }
           }
         }
      }
      function check1(str){
                
               
               
            if(str.match(/^[\w]{6,12}$/)){
              document.getElementById("pass").innerHTML="";
               document.getElementById("pass").className="";
            }else{
              document.getElementById("pass").innerHTML="密码强度不够";
               document.getElementById("pass").className="alert alert-info";
            }



      }function check2(str){
        var p=document.getElementById("p").value;
        if(str==p){
      document.getElementById("pass1").innerHTML="";
         document.getElementById("pass1").className="";
        }else{
          
      document.getElementById("pass1").innerHTML="两次密码不一致";
               document.getElementById("pass1").className="alert alert-info";}
      }
      function check3(str){
        if(str.match(/\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*/)){
         document.getElementById("email").innerHTML="";
         document.getElementById("email").className="";
        }else{document.getElementById("email").innerHTML="邮箱格式不合法";
               document.getElementById("email").className="alert alert-info";}
      }