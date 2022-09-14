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
                    <input type="email" class="inputEmail" id="inputEmail" runat="server"/>
                    <asp:Label CssClass="lblInput" ID="lblEmail" runat="server" Visible="false" ForeColor="#F24B0D"></asp:Label>
                </div>

                <div class="input">
                    <label for="inputPass">Parolă</label>
                    <input type="password" class="inputPass" id="inputPass" runat="server"/>
                    <asp:Label CssClass="lblInput" ID="lblPass" runat="server" Visible="false" ForeColor="#F24B0D"></asp:Label>
                </div>

                <div class="rememberPassCheck">
                    <label for="rememberPass">Reține parola</label>
                    <input type="checkbox" value="" id="rememberPass" runat="server"/>
                </div>

                <div class="buttons">
                    <asp:button id="loginBtn" CssClass="button" runat="server" Text="AUTENTIFICĂ-TE" OnClick="loginBtn_Click"/>
                    <asp:button id="backBtn" CssClass="button" runat="server" Text="ÎNAPOI" OnClick="backBtn_Click"/>
                </div>

                <hr />

                <p class="redirect">Nu ți-ai făcut cont? <a href="Register.aspx">Înregistrează-te</a> !</p>
            </div>
        </div>
        <%--<asp:SqlDataSource ID="Sample" runat="server" ConnectionString="<%$ ConnectionStrings:UsersConnectionString %>" SelectCommand="SELECT * FROM [Users]"></asp:SqlDataSource>--%>
    </form>
</body>
</html>
