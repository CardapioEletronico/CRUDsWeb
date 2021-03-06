﻿<%@ Page Async="true" Language="C#" MasterPageFile="~/RestAdm.Master"  AutoEventWireup="true" CodeBehind="WebCRUDCardapio.aspx.cs" Inherits="RestauranteWeb.WebCRUDCardapio" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
            <div>
                <table style="width:100%;">
                    <tr style="float:left" class="col-lg-12">
                        <td class="col-lg-6">
                            <asp:TextBox CssClass="col-lg-12" ID="textBoxDesc" runat="server" PlaceHolder="Descrição"  style="margin-left: -29px; margin-top: 0px;" ></asp:TextBox>
                        </td>
                        <td class="col-lg-6">
                            <asp:RequiredFieldValidator Width="500px" ValidationGroup="valGroup1" style="margin-top: 10px" CssClass="col-lg-6" ID="RequiredFieldValidator2" runat="server" ErrorMessage="É necessário preencher o campo para inserir o cardápio" ControlToValidate="textBoxDesc"></asp:RequiredFieldValidator>
                        </td>
                    </tr>

                    <tr>
                        <td style="margin-top: -100px;">
                            <asp:Button ID="btnSelect"  CssClass="ls-btn-primary" runat="server" Text="Atualizar Lista" OnClick="btnSelect_Click" />
                            <asp:Button ID="btnInsert" ValidationGroup="valGroup1" CssClass="ls-btn-primary" runat="server" Text="Inserir" OnClick="btnInsert_Click" />
                        </td>
                    </tr>
                    
                    <tr style="width:100%">
                        <td class="auto-style1">
                            
                            <asp:GridView GridLines="Horizontal" CssClass="ls-table ls-bg-header bg-customer-support col-md-12" ID="GridView1" runat="server"
                            AutoGenerateColumns="false" DataKeyNames="Id" OnRowEditing="OnRowEditing" OnRowCancelingEdit="OnRowCancelingEdit"
                            OnRowUpdating="OnRowUpdating" OnRowDeleting="OnRowDeleting" EmptyDataText="Nenhum restaurante foi adicionado." 
                            OnRowDataBound="GridView1_RowDataBound" OnRowCommand="GridView1_RowCommand">
                            <Columns>
            
                                <asp:TemplateField HeaderText="Cardápio" SortExpression="Descricao" >
                                    <EditItemTemplate>
                                        <asp:TextBox ID="txtDescricao" runat="server" Text='<%# Eval("Descricao") %>'></asp:TextBox>
                                    </EditItemTemplate>

                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server"
                                            Text='<%# Eval("Descricao") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>

                                <asp:CommandField ButtonType="Link" ItemStyle-CssClass="pull-right" ShowEditButton="true" edittext="Editar" ItemStyle-Width="100">
                                    <HeaderStyle Width="100px"></HeaderStyle>

                                </asp:CommandField>

                                <%--<asp:CommandField ShowDeleteButton="true" ItemStyle-CssClass="pull-right" ButtonType="Link" deletetext="Excluir" ItemStyle-Width="100"/>--%>

                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1"
                                            CommandArgument='<%# Eval("Id") %>'
                                            CommandName="Deletar" runat="server">
                                        Excluir</asp:LinkButton>
                                    </ItemTemplate>
                                    <HeaderStyle Width="100px"></HeaderStyle>
                                </asp:TemplateField> 
                            </Columns>
                        </asp:GridView>

                        </td>
                        <td>&nbsp;</td>
                    </tr>
                </table>
               
            </div>
            <link href="css/locastyle.css" rel="stylesheet" type="text/css"/>
            <link href="css/style.css" rel="stylesheet" type="text/css" />
            <link href="css/StyleSheet1.css" rel="stylesheet" />
            <link rel="icon" sizes="192x192" href="/locawebstyle/assets/images/ico-boilerplate.png"/>
            <link rel="apple-touch-icon" href="/locawebstyle/assets/images/ico-boilerplate.png"/>
</asp:Content>


