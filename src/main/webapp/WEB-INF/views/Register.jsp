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
			<form class="form-horizontal">
				<fieldset>

					<!-- Form Name -->
					<legend>Form Name</legend>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="textinput">Name:</label>
						<div class="col-md-12">
							<input name="textinput" class="form-control input-md"
								id="textinput" type="text" placeholder="Name">

						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="passwordinput">Password:</label>
						<div class="col-md-12">
							<input name="passwordinput" class="form-control input-md"
								id="passwordinput" type="password" placeholder="Password">

						</div>
					</div>

					<!-- Text input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="E-mail">E-mail:</label>
						<div class="col-md-12">
							<input name="E-mail" class="form-control input-md" id="E-mail"
								type="text" placeholder="E-mail">

						</div>
					</div>

					<!-- Password input-->
					<div class="form-group">
						<label class="col-md-4 control-label" for="passwordinput">Password:</label>
						<div class="col-md-12">
							<input name="passwordinput" class="form-control input-md"
								id="passwordinput" type="password" placeholder="Password">

						</div>
					</div>

					<!-- File Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="filebutton">Upload
							CV</label>
						<div class="col-md-12">
							<input name="filebutton" class="input-file" id="filebutton"
								type="file">
						</div>
					</div>

					<!-- Button -->
					<div class="form-group">
						<label class="col-md-4 control-label" for="singlebutton">Submit</label>
						<div class="col-md-12">
							<button name="singlebutton" class="btn btn-primary"
								id="singlebutton">Button</button>
							<button name="singlebutton" class="btn btn-primary"
								id="testbutton">Test</button>								
						</div>
					</div>

				</fieldset>
			</form>

		</div>
	</div>
	<script type="text/javascript">
		$("#testbutton").click(function(){
			TiaCommon.test();
			return;
		});
	</script>
</body>
</html>