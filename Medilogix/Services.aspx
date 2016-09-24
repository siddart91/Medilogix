<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="Medilogix.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="services">
		<div class="container">
			<div class="services-main">
                	<div class="lorem-middle" style="border-radius:15px;">
				<div class="lorem-middle-top">
				<div class="panel-heading">
								<h3 class="panel-title" style="color: #ffffff">Order Delivery/Vaccine
									
								</h3>
							</div>
                    <div class="panel panel-archon">
							
							<div class="panel-body" align="left">
								<%--<form class="form-vertical" role="form">--%>
									<div class="form-group">
										<label>Email</label>
										<input type="email" class="form-control" id="inputEmail4" placeholder="Email">
									</div>
									<div class="form-group">
										<label>Pick-Up</label>
										<textarea  class="form-control" id="Textarea3" placeholder="Puck-up" rows="2"></textarea>
									</div>

                                    	<div class="form-group">
										<label>Delivered</label>
										<textarea  class="form-control" id="Textarea1" placeholder="Delivered" rows="2"></textarea>
									</div>

                                    						
									
									
									<div class="form-group">
										<label>Delivery Information</label>
										<div class="checkbox">
											<label>
												<input type="checkbox" value="">
												Cheques :
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" value="">
												Documents :
											</label>
										</div>
										<div class="checkbox">
											<label>
												<input type="checkbox" value="">
												Express :
											</label>
										</div>	
                                        	<div class="checkbox">
											<label>
												<input type="checkbox" value="">
												Filling :
											</label>
										</div>		
                                        	<div class="checkbox">
											<label>
												<input type="checkbox" value="">
												Prescription :
											</label>
										</div>		
                                        	<div class="checkbox">
											<label>
												<input type="checkbox" value="">
												Same Day :
											</label>
										</div>	
                                        <div class="checkbox">
											<label>
												<input type="checkbox" value="">
											 Vaccine :
											</label>
										</div>									  
									</div>
								<div class="form-group">
										<label>Comments</label>
									<textarea  class="form-control" id="Textarea2" placeholder="Type any comment here..." rows="2"></textarea>
									</div>

									<button type="submit" class="btn btn-primary">Submit</button>
									<button type="submit" class="btn btn-default">Reset</button>
								<%--</form>--%>
							</div>
						</div>
			
				</div>
				
			</div>
			</div>
		</div>
	</div>
	<!--End-services-->	
</asp:Content>
