<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="ShoeWebpage.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Kroma</title>
    <link rel="stylesheet" href="Register.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.0/css/bootstrap.min.css" integrity="sha512-F7WyTLiiiPqvu2pGumDR15med0MDkUIo5VTVyyfECR5DZmCnDhti9q5VID02ItWjq6fvDfMaBaDl2J3WdL1uxA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.1.0/js/bootstrap.bundle.min.js" integrity="sha512-PqRelaJGXVuQ81N6wjUrRQelCDR7z8RvKGiR9SbSxKHPIt15eJDmIVv9EJgwq0XvgylszsjzvQ0+VyI2WtIshQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <meta charset="utf-8"/>
    <meta name="viewport" content="width=device-width, initial=1"/>
</head>
<body>

    <div class="container">
        <div class="row">
            <div class="col-sm-9 col-md-7 col-lg-5 mx-auto">
                <div class="card border-0 shadow rounded-3 my-5">
                    <div class="card-body p-4 p-sm-5">
                        <div class="logo">
                            <a href="Index.aspx"><img src="images/Klogo.png" alt="Klogo"/></a>
                        </div>

                        <form id="form1" runat="server">
                            <h5 class="card-title text-center mb-5 fw-light fs-5">Inregistrare</h5>

                            <div class="form-floating mb-3">
                                <input class="form-control" id="emailInput" runat="server"/>
                                <label for="floatingInput">Adresă Email</label>
                                <asp:Label ID="lblEmail" runat="server" Visible="False" Text="Email invalid" ForeColor="#F24B0D"></asp:Label>
                            </div>

                            <div class="form-floating mb-3">
                                <input class="form-control" id="passInput" runat="server"/>
                                <label for="pass">Parolă</label>
                                <asp:Label ID="lblPasword" runat="server" Visible="False" Text="Parola contine numere, litere mici (a-z) si majuscule (A-Z)" ForeColor="#F24B0D"></asp:Label>
                            </div>

                            <div class="form-floating mb-3">
                                <input class="form-control" id="repassInput" runat="server"/>
                                <label for="repassInput">Rescrie parola</label>
                                <asp:Label ID="Label1" runat="server" Visible="False" Text="Parola contine numere, litere mici (a-z) si majuscule (A-Z)" ForeColor="#F24B0D"></asp:Label>
                                
                                <br />
                            </div>

                            <div class="d-grid mt-2">
                                <asp:button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit" runat="server" Text="Înregistreaza-te" OnClick="Unnamed1_Click"></asp:button>
                            </div>

                            <div class="d-grid mt-2">
                                <asp:button class="btn btn-primary btn-login text-uppercase fw-bold" type="submit" runat="server" Text="Înapoi" OnClick="Unnamed2_Click"></asp:button>
                            </div>

                            <hr class="my-4"/>

                            <div class="redirect">
                                <p>Esti deja inregistrat? <a href="Login.aspx">Autentifica-te</a>!</p>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>
