﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Http;
using Newtonsoft.Json;
using System.Text;

namespace RestauranteWeb
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        private string ip = "http://10.21.0.137";
        protected async void Page_Load(object sender, EventArgs e)
        {
            HttpClient httpClient = new HttpClient();

            httpClient.BaseAddress = new Uri(ip);
            //var response = await httpClient.GetAsync("/20131011110061/api/restaurante");
            var response = await httpClient.GetAsync("/20131011110061/api/restaurante");

            var str = response.Content.ReadAsStringAsync().Result;
            List<Models.Restaurante> obj = JsonConvert.DeserializeObject<List<Models.Restaurante>>(str);

            //GridView1.AutoGenerateColumns = true;
            //GridView1.DataSource = obj.ToList();
            Label1.Text = "<h3>Restaurantes</h3>";
            foreach (Models.Restaurante x in obj)
            {
                Label lb2 = new Label();
                lb2.Text = x.ToString();
                TableRow tRow = new TableRow();
                
                TableCell tc = new TableCell();
                tc.Text = x.Id.ToString() + "  -";
                TableCell tc2 = new TableCell();
                tc2.Text = x.Descricao.ToString();
                tRow.Cells.Add(tc);
                tRow.Cells.Add(tc2);
                Table1.Rows.Add(tRow);
            }
        }

        protected async void Button1_Click(object sender, EventArgs e)
        {
            Carregar();
        }

        protected async void Button2_Click(object sender, EventArgs e)
        {
            HttpClient httpClient = new HttpClient();

            httpClient.BaseAddress = new Uri(ip);
            Models.Restaurante f = new Models.Restaurante
            {
                Descricao = textBoxDesc.Text
            };
           
            string s = JsonConvert.SerializeObject(f);

            var content = new StringContent(s, Encoding.UTF8, "application/json");

            await httpClient.PostAsync("/20131011110061/api/restaurante", content);

            Carregar();
        }

        protected async void Button3_Click(object sender, EventArgs e)
        {
            HttpClient httpClient = new HttpClient();

            httpClient.BaseAddress = new Uri(ip);
            Models.Restaurante f = new Models.Restaurante
            {
                Id = int.Parse(textBoxId.Text),
                Descricao = textBoxDesc.Text
            };

            var content = new StringContent(JsonConvert.SerializeObject(f), Encoding.UTF8,"application/json");

            await httpClient.PutAsync("/20131011110061/api/restaurante/" + f.Id, content);

            Carregar();
        }

        protected async void Button4_Click(object sender, EventArgs e)
        {
            HttpClient httpClient = new HttpClient();

            httpClient.BaseAddress = new Uri(ip);

            await httpClient.DeleteAsync("/20131011110061/api/restaurante/" + textBoxId.Text);

            Carregar();
        }

        protected async void Carregar()
        {
            HttpClient httpClient = new HttpClient();

            httpClient.BaseAddress = new Uri(ip);
            var response = await httpClient.GetAsync("/20131011110061/api/restaurante");

            var str = response.Content.ReadAsStringAsync().Result;

            List<Models.Restaurante> obj = JsonConvert.DeserializeObject<List<Models.Restaurante>>(str);
            Table1.Rows.Clear();
            foreach (Models.Restaurante x in obj)
            {
                Label lb2 = new Label();
                lb2.Text = x.ToString();
                TableRow tRow = new TableRow();

                TableCell tc = new TableCell();
                tc.Text = x.Id.ToString() + "  -";
                TableCell tc2 = new TableCell();
                tc2.Text = x.Descricao.ToString();
                tRow.Cells.Add(tc);
                tRow.Cells.Add(tc2);
                Table1.Rows.Add(tRow);
            }
        }
    }
}