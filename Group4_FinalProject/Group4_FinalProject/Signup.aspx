<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="~/Signup.aspx.cs" Inherits="Group4_FinalProject.Signup" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <asp:SqlDataSource ID="userDataSource" runat="server" ConnectionString='<%$ ConnectionStrings:ConnectionString %>' SelectCommand="SELECT * FROM [User]"></asp:SqlDataSource>
    <div class="container w-75 bg-light shadow-lg mx-auto my-5">
        <div class="row">
            <div class="col">
                <img class="w-100 m-0 p-0" src="Images/signup.jpg" />
            </div>
            <div class="col">
                <div class="row">

                    <h2 class=" m-5">Sign Up</h2>
                    <asp:Label ID="feedbackLabel" runat="server" CssClass="text-success text-center" Visible="true"></asp:Label>

                    <div class="col-2 text-center mt-3">
                        <asp:Label ID="Label1" CssClass=" control-label fw-bold" runat="server" Text="Label">EMAIL</asp:Label>
                    </div>
                    <div class="col-8 ms-2">

                        <div class="my-2">
                            <asp:TextBox ID="email" Placeholder="enter email address" CssClass="form-control p-2" TextMode="Email" runat="server"></asp:TextBox>
                        </div>
                        <asp:RegularExpressionValidator ID="emailRegularValidator" runat="server" ErrorMessage="Invalid email address" BorderStyle="NotSet" ControlToValidate="email" CssClass="text-danger" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="emailValidator" runat="server" ErrorMessage="email is requried" ControlToValidate="email" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="row m-auto">
                    <div class="col-6">
                        <asp:Label ID="Label4" CssClass=" control-label fw-bold" runat="server" Text="Label">First Name</asp:Label>
                        <div class="my-2 mb-4">
                            <asp:TextBox ID="firstName" CssClass="form-control p-2" Placeholder="enter first name" runat="server"></asp:TextBox>
                        </div>
                        <div class="col text-right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="first name is requried" ControlToValidate="firstName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-6">
                        <asp:Label ID="Label5" CssClass=" control-label fw-bold" runat="server" Text="Label">Last Name</asp:Label>
                        <div class="my-2 mb-4">
                            <asp:TextBox ID="lastName" CssClass="form-control p-2" Placeholder="enter last name" runat="server"></asp:TextBox>
                        </div>
                        <div class="col text-right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="last name is requried" ControlToValidate="lastName" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>

                    </div>
                </div>
                <div class="row m-auto">
                    <div class="col-6">
                        <asp:Label ID="Label2" CssClass=" control-label fw-bold" runat="server" Text="Label">Password</asp:Label>
                        <div class="my-2 mb-4">
                            <asp:TextBox ID="password" TextMode="Password" CssClass="form-control p-2" Placeholder="enter password" runat="server"></asp:TextBox>
                        </div>
                        <div class="col text-right">
                            <asp:RequiredFieldValidator ID="passwordValidator" runat="server" ErrorMessage="password is requried" ControlToValidate="password" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="col-6">
                        <asp:Label ID="Label3" CssClass=" control-label fw-bold" runat="server" Text="Label">Re-Enter password</asp:Label>
                        <div class="my-2 mb-4">
                            <asp:TextBox ID="reenterPassword" TextMode="Password" CssClass="form-control p-2" Placeholder="Re-Enter password" runat="server"></asp:TextBox>
                        </div>
                        <div class="col text-right">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Reenter password is requried" ControlToValidate="reenterPassword" Display="Dynamic" CssClass="text-danger"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row mx-5 my-3">
                    <div class="row bg-warning mx-auto my-3">
                        <asp:Button ID="btnSignUp" CausesValidation="true" runat="server" Text="SIGN UP" CssClass="btn fw-bold bg-body-secondary " OnClick="btnSignUp_Click" />
                    </div>
                    <div class="row justify-content-center">
                        <a href="Login.aspx" class="text-center text-decoration-none text-secondary">already have an account? 
                            <span class="text-warning text-decoration-underline">Sign In</span>
                        </a>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>
