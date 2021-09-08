<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript">
var socket = null;
var sock = new SockJS("/echo");
socket =sock;
$(document).ready(function(){
    if(!isEmpty($("#session_id").val()))
            connectWS();
});
    $(".chat_start_main").click(function(){
        $(this).css("display","none");
        $(".chat_main").css("display","inline");
    })
    $(".chat_main .modal-header").click(function(){
        $(".chat_start_main").css("display","inline");
        $(".chat_main").css("display","none");
    });
 
    function connectWS(){
        sock.onopen = function() {
               console.log('info: connection opened.');
        };
        sock.onmessage = function(e){
            var splitdata =e.data.split(":");
            if(splitdata[0].indexOf("recMs") > -1)
                $("#recMs").append("["+splitdata[1]+"통의 쪽지가 왔습니다.]");
            else
                $("#chat").append(e.data + "<br/>");
        }
        sock.onclose = function(){
            $("#chat").append("연결 종료");
//              setTimeout(function(){conntectWs();} , 10000); 
        }
        sock.onerror = function (err) {console.log('Errors : ' , err);};
 
    }
    
    $("#board1").click(function(){
        location.href="/board/main_board.do";
    });
 

$("#chatForm").submit(function(event){


        event.preventDefault();


            sock.send($("#message").val());


            $("#message").val('').focus();    


    });    


</script>
</head>
<body>

<div class="container-header">
        <input type="hidden" value="<c:out value='${sessionConfigVO.user_id }'/>" id="session_id"/>
            <c:if test="${sessionConfigVO ne null}">
                <ul style="height:30px;float:right;margin-bottom:20px;" class="fn-font">
                    <li><a style="color:blue;" class="" >${sessionConfigVO.user_name}' s come in</a></li>
                    <c:if test="${sessionConfigVO.naver_login eq true }">
                        <li>
                            <img src="../resources/images/naver_logo.png" style="width:30px;">
                            <a style="color:green;">NAVER 계정으로 접속중 </a>
                            <span id="count" class="badge bg-theme"></span>
                        </li>
                    </c:if>
                </ul>
            </c:if>
            <c:if test='${sessionConfigVO eq null}'>
                <ul style="height:30px;float:right;margin-bottom:20px;" class="fn-font">
                    <li><a style="color:blue;" class="forget_login" onclick="fn_forgetID()">Forget ID/PASSWORD</a></li>
                </ul>    
            </c:if>
            <span id="recMs" name="recMs" style="float:right;cursor:pointer;margin-right:10px;color:pink;"><img src="../resources/images/msgicon.png" style="width:15px;"></span>
        </div>
</body>
</html>