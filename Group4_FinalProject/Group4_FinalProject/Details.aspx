<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Details.aspx.cs" Inherits="Group4_FinalProject.Details" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container w-75 bg-light shadow-lg mx-auto my-5">
        <div class="row">
            <div class="col">
                <img class="w-100 m-0 p-0" src='<%# ResolveUrl("~/Images/" + image) %>' alt='<%# image %>' />
             <asp:TextBox ID="Pimage" runat="server" CssClass="form-control" Visible="false"></asp:TextBox >

            </div>


            <div class="col">
                <h2 class=" m-5"><%# productName %></h2>
                 <asp:TextBox ID="PproductName" runat="server" CssClass="form-control" Visible="false"></asp:TextBox >
               <asp:TextBox ID="Pprice" runat="server" CssClass="form-control" Visible="false"></asp:TextBox >

                <div class="row mx-5 my-3">

                    <div class="my-2">
                        <p class="card-text">
                            <strong>Price:</strong>
                            <span class="text-muted"><del><%# price %></del></span>&nbsp;$<%# salePrice %>
                           <asp:TextBox ID="PsalePrice" runat="server" CssClass="form-control" Visible="false"></asp:TextBox >

                        </p>
                    </div>

                    <div class="my-2 mb-4">
                        <p class="card-text"><strong>Description:</strong> <%# description %></p>
                       <asp:TextBox ID="Pdescription" runat="server" CssClass="form-control" Visible="false"></asp:TextBox >

                    </div>

                    <div class="my-2 mb-4">
                        <div class="row my-2">
                            <label class="col-sm-3 col-md-2" style="margin-right: 10px;">Quantity:</label>
                            <div class="col-sm-3 col-md-2">
                                <asp:TextBox ID="quantity" runat="server" CssClass="form-control" Style="width: 100px; margin-left: 20px;"></asp:TextBox>
                                 <asp:TextBox ID="PId" runat="server" CssClass="form-control"  Visible="false"></asp:TextBox >

                            </div>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"
                                runat="server" ControlToValidate="quantity" Display="Dynamic"
                                ErrorMessage="Quantity is a required field."></asp:RequiredFieldValidator>
                            <asp:RangeValidator ID="RangeValidator1" runat="server" CssClass="text-danger"
                                ControlToValidate="quantity" Display="Dynamic"
                                ErrorMessage="Quantity must range from 1 to 100."
                                MaximumValue="100" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                        </div>
                        <div class="my-2 mb-4 m-5">
                            <asp:Button ID="btnAdd" runat="server" OnClick="btnAdd_Click" Text="Add to Cart" CssClass="text-center text-decoration-none text-secondary" />
                        </div>

                    </div>

                </div>
            </div>
            </div>
        </div>
</asp:Content>
