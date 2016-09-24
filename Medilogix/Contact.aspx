<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Medilogix.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <!--start-contact-->
		<div class="contact">
			<div class="container">
				<div class="contact-main">
					<h3>Contact Us</h3>
					<div class="contact-top">
						<div class="col-md-4 contact-top-left">
							<%--<div class="contact-top-one">
								<h4>ADDRESS:</h4>
									<h6>The Company Name agi.
									<span>756 gt globel Place,</span>
										CD-Road,M 07 435.
									</h6>
							</div>--%>
							<div class="contact-top-one">
								<h4>PHONES:</h4>
									<p>Telephone: 519-601-9077 
									<span>FAX: 519-601-9177</span>
									</p>
							</div>
							<div class="contact-top-one">
								<h4>E-MAIL:</h4>
								<p><a href="mailto:order@medilogix.ca"> order@medilogix.ca</a></p>
							</div>
						</div>
						<div class="col-md-8 contact-top-right">
							
							<input type="text" placeholder="Name">
							<input type="text" placeholder="Email">
							<input type="text" placeholder="Phone">
							<textarea placeholder="Question / Comment"></textarea>
							<div class="sub-button">
								<input type="submit" value="SEND">
							</div>
							
						</div>
						<div class="clearfix"></div>
					</div>
				</div>
			</div>
			<div class="contact-bottom">
				<iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d3806.7201236595974!2d78.43322599999999!3d17.425214!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bcb90d4d27091db%3A0x6c57b46677eaa90e!2sBanjara+Harley-Davidson!5e0!3m2!1sen!2sin!4v1423718741402" frameborder="0" style="border:0"></iframe>
			</div>
		</div>
		<!--End-contact-->
</asp:Content>
