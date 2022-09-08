<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index.aspx.cs" Inherits="ShoeWebpage.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kroma</title>
    <link rel="stylesheet" href="Index.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <%--fonts--%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Oswald&family=Poppins:wght@500&display=swap');
    </style>
    <meta charset="utf-8"/>
 
    <meta name="viewport" content="width=device-width, initial=1"/>

</head>

<body>
    <form id="form1" runat="server">
        <div class="navbar">
            
            <img src="images/Klogo.png" alt="Klogo"/>

            <div class="navbar-links">
                <a href="Index.aspx" class="selected">Acasă</a>
                <a href="Catalog.aspx">Catalog</a>
                <a href="Order.aspx">Comandă</a>
            </div>

            <div class="dropdown">
                <asp:LinkButton class="dropdownBtn" ID="Dropdown" runat="server">
                    <i class="fa-solid fa-circle-user"></i>
                    <i class="fa fa-caret-down arrow"></i>
                </asp:LinkButton>

                <div class="dropdown-content">
                    <a href="Register.aspx">Inregistrare</a>
                    <a href="Login.aspx">Autentificare</a>
                </div>
            </div>

        </div> 

        <div class="img-bg">
                <img src="images/yellow-bg-shoes1.jpg" alt="yellow-bg-shoes1" class="ybgshoes1"/>
        </div>
        
        <div class="text-container">
            <div class="despre">
                <h2>Despre noi</h2>
                <p>Având o colecție multi brand de încălțăminte, Kroma încurajează libertatea de expresie a fiecărui client. Kroma este un concept
                    nou de magazin, care vine în întâmpinarea publicului cu articole de incălțăminte pentru orice ocazie, realizate de branduri 
                    ce și-au câștigat renumele la nivel internațional pentru că propun un design inedit. </p>
            </div>

            <div class="viziune">
                
                <img src="images/pink-shoes-viziune.jpg" alt="pink-shoes-viziune"/> 

                <div class="viziune-text">
                    <h2>Viziune</h2>
                    <p>Viziunea magazinului este de a oferi oricărei persoane posibilitatea de a-și defini un stil vestimentar propriu. 
                        Astfel, Kroma comercializează o colecție generoasă de articole de încălțăminte și accesorii în vogă, pentru toate 
                        stilurile și ocaziile</p>
                </div>
            </div>
        </div>
        
        <div class="footer">
            <ul>
                <li><a href="#">Suport</a></li>
                <li><a href="#">Livrări</a></li>
                <li><a href="#">Feedback</a></li>
            </ul>

            <ul>
                <li><a href="#">Politica de confidențialitate</a></li>
            </ul>

            <ul>
                <li><a href="#">Noutați</a></li>
            </ul>
            <ul>
                <li><a href="#">Contactează-ne</a></li>
            </ul>
            <ul class="contact">
                <li><a><i class="fa-brands fa-twitter-square"></i></a></li>
                <li><a><i class="fa-brands fa-instagram-square"></i></a></li>
                <li><a><i class="fa-brands fa-facebook-square"></i></a></li>
            </ul>
        </div>
    </form>
</body>
</html>
