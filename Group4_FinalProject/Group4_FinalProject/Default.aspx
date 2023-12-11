<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Group4_FinalProject._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <main>
        <section class="row banner">
            <div class="banner-div p-5 text-center">
                <h1 id="aspnetTitle">Welcome Aboard!</h1>
                <p class="lead">We are glad to see that your furniture seeking journey has brought you to us. We promise you no more wandering for your needs.</p>
                <p><a href="http://www.asp.net" class="btn btn-primary btn-md">Dive deep</a></p>
            </div>
        </section>

        <div class="row category-container">
            <div class="container">
                <div class="row align-items-center">
                    <div class="col-md-3 col-sm-12">
                        <h2 class="m-4">Top Categories</h2>
                    </div>
                    <div class="col-md-3 col-sm-4 col-6">
                        <div class="card category-card text-center m-3 px-2 py-3">
                            <img src="./Images/chair.jpg" alt="chair" />
                            <span class="mt-2">Chairs</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-6">
                        <div class="card category-card text-center m-3 px-2 py-3">
                            <img src="./Images/sofa.jpg" alt="sofa" />
                            <span class="mt-2">Sofas</span>
                        </div>
                    </div>
                    <div class="col-md-3 col-sm-4 col-6">
                        <div class="card category-card text-center m-3 px-2 py-3">
                            <img src="./Images/lamp.jpg" alt="lamp" />
                            <span class="mt-2">Lamps</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="container">
            <div class="row my-5">
                <div class="col-4 py-5 d-flex flex-column justify-content-center">
                    <img src="./Images/room.jpg" alt="room" class="img-fluid" />
                </div>
                <div class="col-8 ps-5 py-5 d-flex flex-column justify-content-center align-items-start">
                    <h3><strong>HOW TO DECORATE YOUR DINING ROOM?</strong></h3>
                    <p>Are you tired of coming home to a nondescript bedroom? Or have you had the same style for years and want to give your room a new look? A beautiful bedroom will make a home feel more inviting. We gathered our favorite decoration ideas for your inspiration. Maybe you can build your stylish bedroom space.</p>
                    <button class="btn btn-primary">Discover now</button>
                </div>
            </div>
        </div>
    </main>

</asp:Content>
