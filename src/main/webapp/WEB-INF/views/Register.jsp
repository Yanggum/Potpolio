<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<html lang="en">
<head>
<meta charset="utf-8">
<!-- This file has been downloaded from Bootsnipp.com. Enjoy! -->
<title>Simple Registration form - Bootsnipp.com</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="<%=request.getContextPath()%>/css/bootstrap.min.css"
	rel="stylesheet">
<style type="text/css">
</style>
<script src="<%=request.getContextPath()%>/js/jquery-3.4.1.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
<script src="<%=request.getContextPath()%>/js/TiaCommon.js"></script>
</head>
<body>
	<!------ Include the above in your HEAD tag ---------->
	<div class="container">
		<div class="row">
			<form class="form-horizontal" style="width:100%">
				<fieldset>

					<!-- Form Name -->
					<legend>Form Name</legend>
										
					<div class="form-group">
						<label class="col-md-12 control-label" for="ID">ID</label>
						<div class="col-md-12">
							<input name="E-mail" class="form-control input-md" id="txtId"
								type="text" placeholder="ID">
						</div>
					</div>															
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-12 control-label" for="E-mail">E-mail:</label>
						<div class="col-md-12">
							<input name="E-mail" class="form-control input-md" id="txtEmail"
								type="text" placeholder="E-mail">
						</div>
					</div>										

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">Name:</label>
						<div class="col-md-12">
							<input name="textinput" class="form-control input-md"
								id="txtName" type="text" placeholder="Name">
						</div>
					</div>					
					

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="passwordinput">Password</label>
						<div class="col-md-12">
							<input name="passwordinput" class="form-control input-md"
								id="txtPassword" type="password" placeholder="Password">

						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="passwordinput">Password Confrim</label>
						<div class="col-md-12">
							<input name="passwordinput" class="form-control input-md"
								id="txtPasswordConfirm" type="password" placeholder="Password Confrim">
						</div>
					</div>
					
					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">Address</label>
						<div class="col-md-12">
							<input name="textinput" class="form-control input-md"
								id="txtAddress" type="text" placeholder="Address">
						</div>
					</div>					
					
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">Hp</label>
						<div class="col-md-12">
							<input name="textinput" class="form-control input-md"
								id="txtTel" type="tel" placeholder="Tel">
						</div>
					</div>					
					
					
					<!-- File Button -->
<!-- 					<div class="form-group">
						<label class="col-md-4 control-label" for="filebutton">Upload
							CV</label>
						<div class="col-md-12">
							<input name="filebutton" class="input-file" id="filebutton"
								type="file">
						</div>
					</div>
 -->
					<!-- Button -->
					<div class="form-group">
						<div class="col-md-12" style="text-align:right;">
							<button type="button" class="btn btn-primary"
								id="btnSubmit">Submit</button>
							<button type="button" class="btn btn-primary"
								id="btnBack">Cancel</button>								
						</div>
					</div>

				</fieldset>
			</form>

		</div>
	</div>
	<script type="text/javascript">
	
		$("#btnSubmit").click(function(){	
			var id = $('#txtId').val();
			var email = $('#txtEmail').val();			
			var name = $('#txtName').val();
			var password = $('#txtPassword').val();
			var passwordConfirm = $('#txtPasswordConfirm').val();
			var address = $('#txtAddress').val();
			var tel = $('#txtTel').val();
			
			var emailre = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			var idre = /^[a-z]+[a-z0-9]{5,19}$/g;

			if (id.length < 4 || !idre.test(id)){
				alert("아이디는 최소 영문 4자리이며 소문자와 숫자로 구성되어야 합니다.");
				return;
			}
			
			if (!emailre.test(String(email).toLowerCase())){
				alert("이메일의 형식을 제대로 지정해야 합니다.");
				return;
			}
			
			if (password.length < 8){
				alert("패스워드는 최소 8자리 이상이어야 합니다.");
				return;				
			}
			
			if (name.length < 1) {
				alert("이름은 최소 한 자리 이상이어야 합니다.");
				return;				
			}				
			
			if (password != passwordConfirm){
				alert("비밀번호가 서로 다릅니다!");
				return;				
			}
			
			var o = { id: id, name:name, email: email, password: password, address: address, tel:tel };			
			var stringedObj = JSON.stringify(o);
			
 			TiaCommon.post('<%=request.getContextPath()%>/memberSubmit.do',stringedObj, 
				function(result){
					alert("submit successed!");
				}
			);
 		});
	
		$("#btnBack").click(function(){
			location.href = '<%=request.getContextPath()%>/login.do';
			
		});
	</script>
</body>
</html>