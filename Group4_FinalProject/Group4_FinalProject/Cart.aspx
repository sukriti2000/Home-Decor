<%@ Page Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="Group4_FinalProject.Cart" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <section class="h-100" style="background-color: #eee;">
        <div class="container h-100 py-5">
            <div class="row d-flex justify-content-center align-items-center h-100">
                <div class="col-10">

                    <div class="d-flex justify-content-between align-items-center mb-4">
                        <h3 class="fw-normal mb-0 text-black">Shopping Cart</h3>

                    </div>

                    <asp:Repeater ID="cartRepeater" runat="server">
                        <ItemTemplate>
                            <div class="card rounded-3 mb-4">
                                <div class="card-body p-4">
                                    <div class="row d-flex justify-content-between align-items-center">
                                        <div class="col-md-2 col-lg-2 col-xl-2">
                                            <img name="image" src='<%# ResolveUrl("~/Images/" + Eval("Product.Image")) %>' class="img-fluid rounded-3" alt='<%# Eval("Product.Name") %>' />
                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-3">
                                            <p name="Pname" class="lead fw-normal mb-2"><%# Eval("Product.Name") %></p>

                                        </div>
                                        <div class="col-md-3 col-lg-3 col-xl-2 d-flex">



                                            <textbox id="txtTotalPrice" runat="server" readonly="true" class="form-control form-control-sm col-md-3 "><%# Eval("Quantity") %></textbox>


                                        </div>
                                        <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                                            <h5 name="Pprice" class="mb-0">$<%# Eval("Product.SalePrice") %></h5>
                                        </div>
                                        <div class="col-md-1 col-lg-1 col-xl-1 text-end">

                                            <asp:LinkButton runat="server" ID="lnkDelete" CommandArgument='<%# Eval("Product.ID") %>'
                                                OnClientClick="return confirm('Are you sure you want to delete this item?');"
                                                OnClick="btnRemove_Click" CssClass="text-danger">
                                                        <i class="fa-sharp fa-solid fa-trash"></i>
                                            </asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>




                    <div class="card mb-4">
                        <div class="card-body p-4 d-flex flex-row">
                            <div class="form-outline flex-fill">
                                <div class="row">
                                    <div class="col-md-3">
                                        <h4 class="form-label" for="form1" cssclass="mt-6">Total Price:</h4>
                                    </div>
                                    <div class="col-md-3">
                                        <asp:TextBox ID="txtTotalPrice" runat="server" ReadOnly="true" class="form-control form-control-lg"></asp:TextBox>
                                    </div>
                                </div>

                            </div>
                            <asp:LinkButton runat="server" ID="Empty_Cart" OnClientClick="return confirm('Are you sure you want to Remove all Items?');"
                                OnClick="EmptyCart" class="btn btn-warning btn-block btn-lg">
                              Empty Cart
                            </asp:LinkButton>

                        </div>
                    </div>

                    <div class="card">
                        <div class="card-body">
                            <button type="button" class="btn btn-warning btn-block btn-lg">Checkout</button>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </section>
</asp:Content>
