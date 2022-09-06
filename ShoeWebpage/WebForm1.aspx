<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ShoeWebpage.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kroma</title>
    <link rel="stylesheet" href="index.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.0/css/all.min.css" integrity="sha512-10/jx2EXwxxWqCLX/hHth/vu2KY3jCF70dCQB8TSgNjbCVAC/8vai53GfMDrO2Emgwccf2pJqxct9ehpzG+MTw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <%--fonts--%>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Oswald&family=Poppins:wght@500&display=swap');
    </style>
    <meta charset="utf-8"/>
 
    <meta name="viewport" content="width=device-width, initial=1"/>

</head>

<body>
    
    <div class="navbar">
        <div class="logo">
            <img src="Klogo.png" alt="Klogo"/>
        </div>

        <div class="navbar-links">
            <a href="WebForm1.aspx" class="selected">Acasă</a>
            <a href="WebForm2.aspx">Catalog</a>
            <a href="WebForm4.aspx">Comandă</a>
        </div>

        <div class="user">
            <a href="WebForm3.aspx"><i class="fa-solid fa-circle-user"></i></a>
        </div>

    </div> 

    <div class="img-bg">
            <img src="yellow-bg-shoes1.jpg" alt="yellow-bg-shoes1" class="ybgshoes1"/>
    </div>
        
    <div class="text-container">
        <div class="despre">
            <h2>Despre noi</h2>
            <p>Având o colecție multi brand de încălțăminte, Kroma încurajează libertatea de expresie a fiecărui client. Kroma este un concept
                nou de magazin, care vine în întâmpinarea publicului cu articole de incălțăminte pentru orice ocazie, realizate de branduri 
                ce și-au câștigat renumele la nivel internațional pentru că propun un design inedit. </p>
        </div>

        <div class="viziune">
                
            <img src="pink-shoes-viziune.jpg" alt="pink-shoes-viziune"/> 

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
            <li class="list-title"><a href="#">Politica de confidențialitate</a></li>
        </ul>

        <ul>
            <li class="list-title"><a href="#">Noutați</a></li>
        </ul>
        <ul>
            <li class="list-title"><a href="#">Contactează-ne</a></li>
        </ul>
        <ul class="contact">
            <li><a><i class="fa-brands fa-twitter-square"></i></a></li>
            <li><a><i class="fa-brands fa-instagram-square"></i></a></li>
            <li><a><i class="fa-brands fa-facebook-square"></i></a></li>
        </ul>
    </div>
    
</body>
</html>
