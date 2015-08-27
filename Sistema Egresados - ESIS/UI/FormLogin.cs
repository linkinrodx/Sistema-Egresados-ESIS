using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Sistema_Egresados___ESIS.DA;
using Sistema_Egresados___ESIS.BE;

namespace Sistema_Egresados___ESIS.UI
{
    public partial class FormLogin : Form
    {
        public FormLogin()
        {
            InitializeComponent();
            txtUsuario.Focus();
        }

        private string ValidarCampos()
        {
            String mensaje = String.Empty;
            if (txtUsuario.Text.Trim() == string.Empty)
            {
                mensaje += "No ha colocado el Nombre del Usuario";
            }
            return mensaje;
        }

        private void btnIngresar_Click(object sender, EventArgs e)
        {
            string mensaje = ValidarCampos();
            if (mensaje == string.Empty)
            {
                string usuario = txtUsuario.Text.Trim(); string contrasena = txtContrasena.Text.Trim();

                try
                {
                    db_ControlEgresadosDataSet dst = new DA.db_ControlEgresadosDataSet();
                    DA.db_ControlEgresadosDataSetTableAdapters.UsuarioTableAdapter dfd = new DA.db_ControlEgresadosDataSetTableAdapters.UsuarioTableAdapter();

                    dfd.GetUsuariobyId(usuario, contrasena);
                    dfd.FillUsuariobyId(dst.Usuario, usuario, contrasena);

                    if (dst.Usuario.Rows.Count > 0)
                    {
                        CargarUsuario(dst.Usuario.FirstOrDefault());

                        //MessageBox.Show("Bienvenido Usuario " + usuario, "Bienvenido", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        FormMain nuevo = new FormMain();

                        nuevo.Show();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Usted no es Usuario del Sistema", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("No se pudo Ingresar al Sistema." + Environment.NewLine + ex.ToString(), "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation); 
                }
            }
            else
            {
                MessageBox.Show(mensaje, "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }

        }

        private void CargarUsuario(DataRow data)
        {
            UsuarioBE.IdUsuario = Convert.ToInt32(data["IdUsuario"]);
            UsuarioBE.Nombre = Convert.ToString(data["Nombre"]);
            UsuarioBE.Contrasena = Convert.ToString(data["Contrasena"]);
            UsuarioBE.Estado = Convert.ToString(data["Estado"]);
        }
    }
}
