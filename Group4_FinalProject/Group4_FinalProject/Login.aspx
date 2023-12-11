<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Group4_FinalProject.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="userDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    <div class="container w-75 bg-light shadow-lg mx-auto my-5">
        <div class="row">
            <div class="col">
                <img class="w-100 m-0 p-0" src="Images/login.jpg" />
            </div>
            <div class="col">
                <h2 class=" m-5">Sign in</h2>
                <div class="row justify-content-center">
                <asp:Label ID="feedbackLabel" runat="server" CssClass="text-danger text-center" Visible="true" ></asp:Label>
                </div>

                <asp:Label ID="Label3" runat="server" CssClass="text-success text-center" Visible="true"></asp:Label>

                <div class="row mx-5 my-3">
                    <asp:Label ID="Label1" CssClass=" control-label fw-bold" runat="server" Text="Label">EMAIL</asp:Label>
                    <div class="my-2">
                        <asp:TextBox ID="email" Placeholder="enter email address" CssClass="form-control p-2" runat="server"></asp:TextBox>
                    </div>
                    <asp:RegularExpressionValidator ID="emailRegularValidator" runat="server" ErrorMessage="Invalid email address" BorderStyle="NotSet" ControlToValidate="email" CssClass="text-danger" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                    <asp:RequiredFieldValidator ID="emailValidator" runat="server" ErrorMessage="email is requried" ControlToValidate="email" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    <asp:Label ID="Label2" CssClass="mt-2 control-label fw-bold" runat="server" Text="Label">Password</asp:Label>
                    <div class="my-2 mb-4">
                        <asp:TextBox ID="password" CssClass="form-control p-2" Placeholder="enter password" runat="server"></asp:TextBox>
                    </div>
                    <div class="col text-right">
                        <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ErrorMessage="password is requried" ControlToValidate="password" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                    <div class="row bg-warning mx-auto my-3">
                        <asp:Button ID="btnLogin" runat="server" Text="SIGN IN" CssClass="btn fw-bold bg-body-secondary rounded-pill " OnClick="btnLogin_Click" />
                    </div>
                    <div class="row justify-content-center">
                        <a href="Signup.aspx" class="text-center text-decoration-none text-secondary">Don't have an account? 
                            <span class="text-warning text-decoration-underline">Sign Up</span>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
