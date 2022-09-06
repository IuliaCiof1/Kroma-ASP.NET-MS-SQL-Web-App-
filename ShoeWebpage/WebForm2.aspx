<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="ShoeWebpage.WebForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kroma</title>
    <link rel="stylesheet" href="Femei.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Oswald&family=Poppins:wght@500&display=swap');
    </style>

    <meta charset="utf-8"/>
 <!--paginile web sa fie fie afisate corect pentru orice rezolutie -->
 <meta name="viewport" content="width=device-width, initial=1"/>
 <!--Se introduc bibliotecile pentru Bootstrap, FontAwesome, JQuery-->
 <%--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"/>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
 <script src="https://kit.fontawesome.com/a076d05399.js"></script>--%>
</head>
<body>
    
    <form id="form1" runat="server">
    
    <div class="navbar">
            <div class="logo">
               <a href="WebForm1.aspx"><img src="Klogo.png" alt="Klogo"/></a>
            </div>

            <div class="navbar-links">
                <a href="WebForm1.aspx">Acasă</a>
                <a href="WebForm2.aspx" class="selected">Catalog</a>
                <a href="WebForm4.aspx">Comandă</a>
            </div >

            <div class="dropdown">
                <asp:LinkButton class="dropdownBtn" ID="Dropdown" runat="server">
                    <i class="fa-solid fa-circle-user"></i>
                    <i class="fa fa-caret-down"></i>
                </asp:LinkButton>

                <div class="dropdown-content">
                    <a href="WebForm3.aspx">Inregistrare</a>
                    <a href="WebForm3.aspx">Autentificare</a>
                </div>
            </div>
     </div>

    <div class="filter" id="filterDiv" runat="server">
        <h5>Filtru</h5>
            <asp:Button class="button" ID="Button1" runat="server" Text="Toate" OnClick="Button1_Click" />
            <asp:Button class="button" ID="Button2" runat="server" Text="Adidas" OnClick="Button2_Click" />
            <asp:Button class="button" ID="Button3" runat="server" Text="Rebook" OnClick="Button3_Click" />
    </div>

    <div class="container-fluid">
        <asp:Panel CssClass="panel" ID="panel" runat="server" >
            </asp:Panel>
  
        <asp:Label ID="lblError" runat="server" ForeColor="Red"></asp:Label>
    
    </div>

    <div class="footer">
            <ul>
                <li class="list-title">Suport</li>
                <li>Livrări</li>
                <li>Feedback</li>
            </ul>
            <ul>
                <li class="list-title">Politica de confidențialitate</li>
            </ul>
            <ul>
                <li class="list-title">Noutați</li>
            </ul>
            <ul>
                <li class="list-title">Contactează-ne</li>
            </ul>
            <ul>
                <li><i class="fa-brands fa-twitter-square"></i></li>
                <li><i class="fa-brands fa-instagram-square"></i></li>
                <li><i class="fa-brands fa-facebook-square"></i></li>
            </ul>
        </div>
    </form>
</body>
</html>
