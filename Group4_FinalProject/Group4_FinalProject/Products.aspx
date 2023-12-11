<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="Products.aspx.cs" Inherits="Group4_FinalProject.Products" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container w-75 bg-light shadow-lg mx-auto my-5">
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Category]"></asp:SqlDataSource>
        <div class="d-flex justify-content-center mb-4 mt-4">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="category_name" DataValueField="Id" AutoPostBack="true" CssClass="m-4" class="btn btn-secondary dropdown-toggle">
            </asp:DropDownList>
        </div>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Product] WHERE ([category_id] = @category_id)">
            <SelectParameters>
                <asp:ControlParameter ControlID="DropDownList1" Name="category_id" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource2" OnItemCommand="Repeater1_ItemCommand">
            <HeaderTemplate>
                <div class="d-flex flex-wrap">
            </HeaderTemplate>
            <ItemTemplate>
                <div class="card mb-4 border-0 shadow m-lg-4 mt-4" style="width: 18rem;">
                    <img src='<%# ResolveUrl("~/Images/" + Eval("Image")) %>' class="card-img-top p-3" alt='<%# Eval("Image") %>'>
                    <div class="card-body">
                        <h5 class="card-title"><%# Eval("Name") %></h5>
                        <p class="card-text">
                            <span class="text-muted">Price:   <span class="text-danger ml-2"><del>$<%# Eval("Price") %></del></span>  &nbsp; $<%# Eval("Sale_Price") %></span>

                        </p>
                        <asp:Button ID="DetailsButton" runat="server" Text="Details" CssClass="btn btn-secondary" OnClick="DetailsButton_Click" CommandArgument='<%# Eval("Id") %>' />
                    </div>
                </div>
            </ItemTemplate>
            <FooterTemplate>
                </div>
            </FooterTemplate>
        </asp:Repeater>
    </div>
</asp:Content>


