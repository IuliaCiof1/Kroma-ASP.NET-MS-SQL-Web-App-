<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="ShoeWebpage.WebForm5" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Login.css"/>
    <style>
@import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@100;200;300;400&display=swap');
</style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="card-container">
            <div class="card">

                <div class="logo">
                    <a href="Index.aspx"><img src="images/Klogo.png" alt="klogo"/></a>
                </div>

                <h2 class="card-title">Autentificare</h2>

                <div class="input">
                    <label for="inputEmail">Adresa Email</label>
                    <input type="email" class="inputEmail" id="inputEmail"/>
                    
                </div>

                <div class="input">
                    <label for="inputPass">Parolă</label>
                    <input type="password" class="inputPass" id="inputPass"/>
                </div>

                <div class="rememberPassCheck">
                    <label for="rememberPass">Reține parola</label>
                    <input type="checkbox" value="" id="rememberPass"/>
                </div>

                <div class="buttons">
                    <asp:button id="loginBtn" CssClass="button" runat="server" Text="AUTENTIFICĂ-TE"></asp:button>
                    <asp:button id="backBtn" CssClass="button" runat="server" Text="ÎNAPOI"/>
                </div>

                <hr />

                <p class="redirect">Nu ți-ai făcut cont? <a href="Register.aspx">Înregistrează-te</a> !</p>
            </div>
        </div>
    </form>
</body>
</html>
