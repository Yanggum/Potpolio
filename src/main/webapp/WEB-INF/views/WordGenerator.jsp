<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
    <head>
    <title> 랜덤 단어 생성기 v2.0 </title>
    <meta charset="UTF-8"/>
    <meta name="keywords" content="인사이더 보드게임 랜덤단어 단어생성 랜덤단어생성기">
	<meta name="description" content="인사이더 외 단어를 사용하는 보드게임을 위한 랜덤 단어 생성기">
	<meta name="author" content="Jonathan Lee - jungdolpooh@gamil.com">
    <link rel="stylesheet" href="<%=this.getServletContext().getContextPath()%>/css/wordgen.css"/>
    <link rel="stylesheet" type="text/css" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="<%=this.getServletContext().getContextPath()%>/js/jquery-3.4.1.min.js"></script>        
    <script src="<%=this.getServletContext().getContextPath()%>/js/wordgen.js"></script>        
    </head>

    <body>
    
        <div class="wrapper">
        
            <div id="menuDiv">
                <h1 id="picText">랜덤 단어</h1>
            </div>

            <div id="btnDiv1">
                <a class="myButton" id="btnWordGen">단어 만들기</a>
            </div>
            <div id="btnDiv2">
                <a id="hidebtn" class="myButton" onclick="hide()">숨기기</a>
            </div>

            <div id="inputDiv">
                <input type="text" id="awinput" placeholder="추가할 단어를 입력해주세요" onkeypress="javascript:if(event.keyCode==13){addWordJsp()}" />
                <input type="button" id="addbtn" value="추가"/>
            </div>   
        </div>

        <div class="push"></div>
 

        <footer class="footer">
            <div id="mail">
                <label>jungdolpooh@gmail.com</label>
            </div>
        </footer>
        
        
        <script>                
        	$(document).ready(function() {
        		
    			$("#btnWordGen").click(function () {
//					alert("test");

					$.ajax ({
						  // URL은 필수 요소이므로 반드시 구현해야 하는 Property입니다.
						  url	: "http://localhost:8080/<%=this.getServletContext().getContextPath()%>/randWord.do", // 요청이 전송될 URL 주소
						  type	: "POST", // http 요청 방식 (default: ‘GET’)
						  contentType : "application/json", // 요청 컨텐트 타입 
						  dataType    : "json", // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)

						  success : function(data, status, xhr) {
						    // 정상적으로 응답 받았을 경우에는 success 콜백이 호출되게 됩니다.
						    // 이 콜백 함수의 파라미터에서는 응답 바디, 응답 코드 그리고 XHR 헤더를 확인할 수 있습니다.						    
						    $("#picText").html(data.word);
						    
//						    debugger;
						  },
						  error	: function(xhr, status, error) {
						        // 응답을 받지 못하였다거나 정상적인 응답이지만 데이터 형식을 확인할 수 없기 때문에 
						        // error 콜백이 호출될 수 있습니다.
						        // 예를 들어, dataType을 지정해서 응답 받을 데이터 형식을 지정하였지만,
						        // 서버에서는 다른 데이터형식으로 응답하면  error 콜백이 호출되게 됩니다.
						  },
						  complete : function(xhr, status) {
						    // success와 error 콜백이 호출된 후에 반드시 호출됩니다.
						    // try - catch - finally의 finally 구문과 동일합니다.
						  }
					});					
					
    			});
    			
    			$("#addbtn").click( function() {		
    				addWordJsp();
    			} );
    			
    			
        	});
        	
        	
        	function addWordJsp(){
				var val = $("#awinput").val();				
				var dataObj = { "word" : val };				
				var data = JSON.stringify(dataObj);			
				
				$.ajax ({
					  // URL은 필수 요소이므로 반드시 구현해야 하는 Property입니다.
					  url	: "http://localhost:8080/<%= this.getServletContext().getContextPath()%>/insertWord.do", // 요청이 전송될 URL 주소
					  type	: "GET", // http 요청 방식 (default: ‘GET’)
					  contentType : "application/json", // 요청 컨텐트 타입 
					  dataType    : "json", // 응답 데이터 형식 (명시하지 않을 경우 자동으로 추측)
					  data	  : { word : val },
					  success : function(data, status, xhr) {
					    // 정상적으로 응답 받았을 경우에는 success 콜백이 호출되게 됩니다.
					    // 이 콜백 함수의 파라미터에서는 응답 바디, 응답 코드 그리고 XHR 헤더를 확인할 수 있습니다.						    
					    if (data.resultCode == "0000"){
					    	alert("성공적으로 저장되었습니다.");					    	
					    }
					    else {
					    	alert("저장에 실패하였습니다. 오류 코드:" + data.resultCode);					    						    						    	
					    }
					    
					    
//					    debugger;
					  },
					  error	: function(xhr, status, error) {
					        // 응답을 받지 못하였다거나 정상적인 응답이지만 데이터 형식을 확인할 수 없기 때문에 
					        // error 콜백이 호출될 수 있습니다.
					        // 예를 들어, dataType을 지정해서 응답 받을 데이터 형식을 지정하였지만,
					        // 서버에서는 다른 데이터형식으로 응답하면  error 콜백이 호출되게 됩니다.
					  },
					  complete : function(xhr, status) {
					    // success와 error 콜백이 호출된 후에 반드시 호출됩니다.
					    // try - catch - finally의 finally 구문과 동일합니다.
					  }
				});			        		        		
        	}        	
        
        </script>
    </body>


</html>