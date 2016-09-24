<%@ Page Title="" Language="C#" MasterPageFile="~/Main.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Medilogix.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div>
            <h2>REGISTER</h2>
            <div>
                <asp:TextBox ID="txtUname" runat="server" placeholder="Name"></asp:TextBox>
                <asp:TextBox ID="txtCname" runat="server" placeholder="Company Name"></asp:TextBox><br />
                <span>Gender</span>
                <asp:RadioButtonList ID="RbtnGen" runat="server">
                    <asp:ListItem>Male</asp:ListItem>
                    <asp:ListItem>Female</asp:ListItem>
                </asp:RadioButtonList>
                <asp:TextBox ID="txtPadd" runat="server" placeholder="Personal Address" TextMode="MultiLine"></asp:TextBox>
                <asp:TextBox ID="txtCadd" runat="server" placeholder="Company Address" TextMode="MultiLine"></asp:TextBox>
                <asp:TextBox ID="txtMob" runat="server" placeholder="Mobile No."></asp:TextBox>
                <asp:TextBox ID="txtLno" runat="server" placeholder="Landline No."></asp:TextBox><br />
                <asp:TextBox ID="txtEmail" runat="server" placeholder="Email ID"></asp:TextBox>
                <asp:TextBox ID="txtPass" runat="server" placeholder="Password" TextMode="Password"></asp:TextBox>
                <asp:TextBox ID="txtRpass" runat="server" placeholder="Retype Password" TextMode="Password"></asp:TextBox><br />
                <asp:Button ID="btnSignup" runat="server" Text="Sign Up" OnClick="btnSignup_Click"/>
            </div>
        </div>
    </div>
</asp:Content>
