using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Sistema_Egresados___ESIS.BE;
using Sistema_Egresados___ESIS.BR;

namespace Sistema_Egresados___ESIS
{  
    public partial class FormAdministrar : Form
    {
        #region Variables
        EgresadoBE oEgresado;
        EgresadoDetalleBE oEgresadoDetalle;
        EstadoForm meEstadoForm, meEstadoDetalle;
        #endregion

        #region Propiedades
        public EstadoForm EstadoFormulario
        {
            get { return meEstadoForm; }
            set { meEstadoForm = value; SetEstadoForm(); }
        }

        public EstadoForm EstadoDetalle
        {
            get { return meEstadoDetalle; }
            set { meEstadoDetalle = value; SetEstadoDetalle(); }
        }

        public bool IsFormOnEditing
        {
            get { return (meEstadoForm == EstadoForm.Insertando || meEstadoForm == EstadoForm.Modificando); }
        }
        public bool IsFormOnEditingDetalle
        {
            get { return (meEstadoDetalle == EstadoForm.Insertando || meEstadoDetalle == EstadoForm.Modificando); }
        }
        #endregion                

        #region Metodos
        private void SetEstadoForm()
        {
            bool flag = IsFormOnEditing;
            btnNuevo.Enabled = !flag;
            btnGuardar.Enabled = flag;
            btnCancelar.Enabled = flag;
            btnModificar.Enabled = meEstadoForm == EstadoForm.Navegando;
            gbxEgresado.Enabled = !IsFormOnEditing;
            btnEliminar.Enabled = meEstadoForm == EstadoForm.Navegando;

            gbxEgresado.Enabled = flag;
            //gbxEgresadoDetalle.Enabled = flag;
            //dgvEgresadosDetalle.Enabled = flag;

            if (flag)
            {
                EstadoDetalle = EstadoForm.Navegando;
            }
            else
            {
                btnNuevo1.Enabled = flag;
                btnActualizar1.Enabled = flag;
                btnCancelar1.Enabled = flag;
                btnModificar1.Enabled = flag;
            }
        }

        private void SetEstadoDetalle()
        {
            bool flag = IsFormOnEditingDetalle;
            btnNuevo1.Enabled = !flag;
            btnActualizar1.Enabled = flag;
            btnCancelar1.Enabled = flag;
            btnModificar1.Enabled = EstadoDetalle == EstadoForm.Navegando;
            if (oEgresado == null || oEgresado.Detalle == null || oEgresado.Detalle.Count == 0 || oEgresado.Detalle.Count == 0)
            { btnModificar1.Enabled = false; }

            gbxEgresadoDetalle.Enabled = flag;
            dgvEgresados.Enabled = !flag;
        }  

        public FormAdministrar()
        {
            InitializeComponent();
            InicializarData();
            btnNuevo1.Enabled = false;
        }

        private void InicializarData()
        {
            EstadoFormulario = EstadoForm.Vacio;
            EstadoDetalle = EstadoForm.Vacio;
            ConfigurarGrid();
            LimpiarBusqueda();
        }

        private void ConfigurarGrid()
        {
            dgvEgresadosDetalle.AutoGenerateColumns = false;
            dgvEgresadosDetalle.AutoSizeRowsMode = DataGridViewAutoSizeRowsMode.AllCells;
            DataGridViewColumn oColEmpresa  = dgvEgresadosDetalle.Columns[gcEmpresa.Index];
            oColEmpresa.DefaultCellStyle.WrapMode = DataGridViewTriState.True;
            oColEmpresa.AutoSizeMode = DataGridViewAutoSizeColumnMode.Fill;
        }

        private void LimpiarBusqueda()
        {
            txtDNIBus.Text = string.Empty;
            txtEgresadoBus.Text = string.Empty;
            dtpFechaInicio.Value = new DateTime(2001,1,1);
            dtpFechaFin.Value = DateTime.Now;

            //dgvEgresados.DataSource = null;
        }

        private void LimpiarEgresado()
        {
            txtNombres.Text = string.Empty;
            txtApellidoPaterno.Text = string.Empty;
            txtApellidoMaterno.Text = string.Empty;

            txtDNI.Text = string.Empty;
            dtpFechaNac.Value = DateTime.Now;
            txtDireccion.Text = string.Empty;

            txtDistrito.Text = string.Empty;
            txtProvincia.Text = string.Empty;
            txtTelefono.Text = string.Empty;
            txtCelular.Text = string.Empty;

            txtEmail.Text = string.Empty;
            txtAnoEgreso.Text = string.Empty;     
        }

        private void LimpiarEgresadoDetalle()
        {
            txtEmpresa.Text = string.Empty;
            txtPuesto.Text = string.Empty;
            txtArea.Text = string.Empty;

            dtpInicioLab.Value = DateTime.Now;
            dtpFinLab.Value = DateTime.Now;

            txtDescripTarea.Text = string.Empty;
        }

        private string CamposValidosEgresado()
        {
            string mensaje = string.Empty;

            if (txtNombres.Text.Trim().ToString() == string.Empty)
            {
                mensaje += "No ha colocado el Nombre del Egresado." + Environment.NewLine;
            }
            if (txtApellidoPaterno.Text.Trim().ToString() == string.Empty)
            {
                mensaje += "No ha colocado el Apellido Paterno del Egresado." + Environment.NewLine;
            }
            if (txtApellidoMaterno.Text.Trim().ToString() == string.Empty)
            {
                mensaje += "No ha colocado el Apellido Materno del Egresado." + Environment.NewLine;
            }
            if (txtDNI.Text.Trim().ToString() == string.Empty)
            {
                mensaje += "No ha colocado el DNI del Egresado." + Environment.NewLine;
            }
            else if (txtDNI.Text.Trim().ToString().Length < 8)
            {
                mensaje += "No ha colocado correctamente el DNI del Egresado." + Environment.NewLine;
            }
            if (txtAnoEgreso.Text.Trim().ToString() == string.Empty)
            {
                mensaje += "No ha colocado el Año de Egreso." + Environment.NewLine;
            }
            return mensaje;
        }

        private string CamposValidosEgresadoDetalle()
        {
            string mensaje = string.Empty;

            if (txtEmpresa.Text.Trim().ToString() == string.Empty)
            {
                mensaje += "No ha colocado la Empresa." + Environment.NewLine;
            }
            if (txtPuesto.Text.Trim().ToString() == string.Empty)
            {
                mensaje += "No ha colocado el Puesto." + Environment.NewLine;
            }
            if (dtpInicioLab.Value > dtpFinLab.Value)
            {
                mensaje += "La Fecha de Inicio Laboral es Mayor que la Fecha de Fina Laboral." + Environment.NewLine;
            }
            return mensaje;
        }

        private void Nuevo()
        {
            oEgresado = new EgresadoBE();
            bsrEgresadosDetalle.DataSource = oEgresado.Detalle;
            EstadoFormulario = EstadoForm.Insertando;
            tabEgresado.SelectTab(tpgRegistrar);

            LimpiarEgresado();
            LimpiarEgresadoDetalle();
        }

        private void NuevoDetalle()
        {
            btnGuardar.Enabled = false;
            btnCancelar.Enabled = false;
            oEgresadoDetalle = new EgresadoDetalleBE();
            EstadoDetalle = EstadoForm.Insertando;

            LimpiarEgresadoDetalle();
        }

        private void Modifcar()
        {
            if (oEgresado != null)
            {
                EstadoFormulario = EstadoForm.Modificando;
            }
            else
            {
                EstadoFormulario = EstadoForm.Navegando;
            }
        }

        private void ModificarDetalle()
        {
            if (oEgresadoDetalle != null)
            {
                btnGuardar.Enabled = false;
                btnCancelar.Enabled = false;
                EstadoDetalle = EstadoForm.Modificando;
                txtEmpresa.Focus(); 
            }
            else
            {
                EstadoDetalle = EstadoForm.Navegando;
            }
        }

        private void ActualizarDetalle(EgresadoDetalleBE EgresadoDetalle)
        {
            oEgresadoDetalle = new EgresadoDetalleBE();
            oEgresadoDetalle = EgresadoDetalle;
            txtEmpresa.Text = oEgresadoDetalle.Empresa;
            txtPuesto.Text = oEgresadoDetalle.Puesto;
            txtArea.Text = oEgresadoDetalle.Area;
            dtpInicioLab.Value = oEgresadoDetalle.InicioLaboral;
            dtpFinLab.Value = oEgresadoDetalle.FinLaboral;
            txtDescripTarea.Text = oEgresadoDetalle.DescripcionTarea;
        }

        private void Guardar()
        {
            try
            {
                if (ValidarEstado() < 2 || true)
                {
                    if (CamposValidosEgresado() == string.Empty)
                    {
                        if (MessageBox.Show("¿Desea Guardar el Registro?", this.Text, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                        {
                            LlenarEgresado();
                            switch (EstadoFormulario)
                            {
                                case EstadoForm.Insertando:
                                    EgresadoBR.InsEgresado(oEgresado);
                                    break;
                                case EstadoForm.Modificando:
                                    EgresadoBR.UpdEgresado(oEgresado, Convert.ToInt32(EstadoOperacion.Activo));
                                    break;
                            }
                            MessageBox.Show("Se guardó Satisfactoriamente.", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Information);
                            EstadoFormulario = EstadoForm.Navegando;
                            CargarEgresado(oEgresado.IdEgresado);
                        }
                    }
                    else
                    {
                        MessageBox.Show(CamposValidosEgresado(), "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                    }
                }
                else
                {
                    MessageBox.Show("Solo puede tener un Trabajo Activo", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
                
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se pudo realizar la operación." + Environment.NewLine + ex.ToString(), this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
            
        }

        private void GuardarDetalle()
        {
            btnGuardar.Enabled = true;
            btnCancelar.Enabled = true;

            try
            {
                if (CamposValidosEgresadoDetalle() == string.Empty)
                {
                    LlenarEgresadoDetalle();
                    switch (EstadoDetalle)
                    {
                        case EstadoForm.Insertando:
                            //EgresadoDetalleBR.InsDetalle(oEgresadoDetalle);
                            oEgresado.Detalle.Add(oEgresadoDetalle);
                            break;
                        case EstadoForm.Modificando:
                            //List<EgresadoDetalleBE> nuevo = new List<EgresadoDetalleBE>();
                            //foreach (EgresadoDetalleBE o in oEgresado.Detalle)
                            //{
                            //    if (bsrEgresadosDetalle.Current == oEgresadoDetalle)
                            //    {
                            //        nuevo.Add(oEgresadoDetalle);
                            //    }
                            //    else
                            //    {
                            //        nuevo.Add(o);
                            //    }
                            //}
                            //oEgresado.Detalle = nuevo;

                            //EgresadoDetalleBR.UpdDetalle(oEgresadoDetalle, Convert.ToInt32(EstadoOperacion.Activo));
                            break;
                    }
                    EstadoDetalle = EstadoForm.Navegando;
                    bsrEgresadosDetalle.ResetBindings(false);
                }
                else
                {
                    MessageBox.Show(CamposValidosEgresadoDetalle(), "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se pudo realizar la operación." + Environment.NewLine + ex.ToString(), this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void Cancelar()
        {
            try
            {
                DialogResult res = MessageBox.Show("¿Desea cancelar la operación actual?" + Environment.NewLine + "Perderá los cambios realizados.", this.Text, MessageBoxButtons.YesNo, MessageBoxIcon.Question);
                if (res == DialogResult.Yes)
                {
                    if (EstadoFormulario == EstadoForm.Insertando)
                    {
                        LimpiarEgresado();
                        LimpiarEgresadoDetalle();
                        oEgresado = null;
                        EstadoFormulario = EstadoForm.Vacio;
                    }
                    else if (EstadoFormulario == EstadoForm.Modificando)
                    {
                        CargarEgresado(oEgresado.IdEgresado);
                        EstadoFormulario = EstadoForm.Navegando;
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Se ha Producido un error" + Environment.NewLine + ex.ToString(), "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Error);                
            }
        }

        private void Eliminar()
        {
            try
            {
                if (MessageBox.Show("¿Esta seguro de Eliminar el Registro?", this.Text, MessageBoxButtons.YesNo, MessageBoxIcon.Question) == DialogResult.Yes)
                {
                    EgresadoBR.UpdEgresado(oEgresado, Convert.ToInt32(EstadoOperacion.Inactivo));
                            
                    MessageBox.Show("Se Eliminó Satisfactoriamente.", this.Text, MessageBoxButtons.OK, MessageBoxIcon.Information);

                    LimpiarEgresado();
                    LimpiarEgresadoDetalle();
                    oEgresado = null;
                    EstadoFormulario = EstadoForm.Vacio;
                    bsrEgresadosDetalle.Clear();
                    bsrEgresadosDetalle.ResetBindings(false);
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se pudo realizar la operación." + Environment.NewLine + ex.ToString(), this.Text, MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private int ValidarEstado()
        {
            int count = 0;
            if (oEgresado.Detalle != null)
            {
                foreach (EgresadoDetalleBE x in oEgresado.Detalle)
                {
                    if (x.Estado == (int)EstadoOperacion.Activo)
                    {
                        count++;
                    }
                }
            }
            
            return count;
        }

        private void LlenarEgresado()
        {
            oEgresado.Nombres = txtNombres.Text.Trim().ToUpper().ToString();
            oEgresado.ApellidoPaterno = txtApellidoPaterno.Text.Trim().ToUpper().ToString();
            oEgresado.ApellidoMaterno = txtApellidoMaterno.Text.Trim().ToUpper().ToString();
            oEgresado.DNI = txtDNI.Text.Trim().ToUpper().ToString();
            oEgresado.FechaNacimiento = dtpFechaNac.Value;
            oEgresado.Direccion = txtDireccion.Text.Trim().ToUpper().ToString();
            oEgresado.Distrito = txtDistrito.Text.Trim().ToUpper().ToString();
            oEgresado.Provincia = txtProvincia.Text.Trim().ToUpper().ToString();
            oEgresado.Telefono = txtTelefono.Text.Trim().ToUpper().ToString();
            oEgresado.Celular = txtCelular.Text.Trim().ToUpper().ToString();
            oEgresado.Email = txtEmail.Text.Trim().ToString();
            oEgresado.AñoEgreso = Convert.ToInt32(txtAnoEgreso.Text.Trim());
        }
        
        private void LlenarEgresadoDetalle()
        {
            oEgresadoDetalle.Empresa = txtEmpresa.Text.Trim().ToUpper().ToString();
            oEgresadoDetalle.Puesto = txtPuesto.Text.Trim().ToUpper().ToString();
            oEgresadoDetalle.Area = txtArea.Text.Trim().ToUpper().ToString();
            oEgresadoDetalle.InicioLaboral = dtpInicioLab.Value;
            oEgresadoDetalle.FinLaboral = dtpFinLab.Value;
            oEgresadoDetalle.DescripcionTarea = txtDescripTarea.Text.Trim().ToUpper().ToString();            
        }

        private void CargarEgresado(int IdEgresado)
        {
            try
            {
                LimpiarEgresado();
                LimpiarEgresadoDetalle();

                oEgresado = new EgresadoBE();
                oEgresado = EgresadoBR.GetEgresado(IdEgresado);

                txtNombres.Text = oEgresado.Nombres;
                txtApellidoPaterno.Text = oEgresado.ApellidoPaterno;
                txtApellidoMaterno.Text = oEgresado.ApellidoMaterno;
                txtDNI.Text = oEgresado.DNI;
                dtpFechaNac.Value = oEgresado.FechaNacimiento;
                txtDireccion.Text = oEgresado.Direccion;
                txtDistrito.Text = oEgresado.Distrito;
                txtProvincia.Text = oEgresado.Provincia;
                txtTelefono.Text = oEgresado.Telefono;
                txtCelular.Text = oEgresado.Celular;
                txtEmail.Text = oEgresado.Email;
                txtAnoEgreso.Text = oEgresado.AñoEgreso.ToString();

                bsrEgresadosDetalle.DataSource = oEgresado.Detalle;
                bsrEgresadosDetalle.ResetBindings(false);
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se pudo cargar los datos correctamente." + Environment.NewLine + ex.ToString(), "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }


        private void SoloNumeros(KeyPressEventArgs e)
        {
            if (Char.IsDigit(e.KeyChar))
            {
                e.Handled = false;
            }
            else if (Char.IsControl(e.KeyChar))
            {
                e.Handled = false;
            }
            else
            {
                e.Handled = true;
            }
        }
        #endregion        

        #region Eventos
        private void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarBusqueda();
        }

        private void btnBuscar_Click(object sender, EventArgs e)
        {
            if (dtpFechaInicio.Value.Date <= dtpFechaFin.Value.Date)
            {
                try
                {
                    short AnoEgreso = txtAnoEgresoBus.Text.Trim().ToString() == string.Empty ? short.Parse("0") : Convert.ToInt16(txtAnoEgresoBus.Text.Trim().ToString());

                    DataTable nuevo = EgresadoBR.GetEgresadoTabla(AnoEgreso, txtEgresadoBus.Text.Trim().ToString(), txtDNIBus.Text.Trim().ToString(), dtpFechaInicio.Value, dtpFechaFin.Value);

                    if (nuevo.Rows.Count > 0)
                    {
                        dgvEgresados.DataSource = nuevo;
                    }
                    else
                    {
                        MessageBox.Show("No se encontraron Datos.", "Mensaje", MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }

                }
                catch (Exception ex)
                {
                    MessageBox.Show("No se pudo cargar los datos correctamente." + Environment.NewLine + ex.ToString(), "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);                                
                }
            }
            else
            {
                MessageBox.Show("No ha colocado correctamente las Fechas de Inicio y Fecha de Fin.", "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }
        }

        private void toolStrip1_ItemClicked(object sender, ToolStripItemClickedEventArgs e)
        {
            switch (e.ClickedItem.ToString())
            {
                case "Nuevo": Nuevo(); break;
                case "Modificar": Modifcar(); break;
                case "Guardar": Guardar(); break;
                case "Cancelar": Cancelar(); break;
                case "Eliminar": Eliminar(); break;
            }

        }

        private void dgvEgresadosDetalle_SelectionChanged(object sender, EventArgs e)
        {
            if (!IsFormOnEditingDetalle && bsrEgresadosDetalle.Count > 0)
            {
                int id = Convert.ToInt32(dgvEgresadosDetalle.CurrentRow.Cells[gcIdEgresadoDetalle.Index].Value);
                int correlativo = Convert.ToInt32(dgvEgresadosDetalle.CurrentRow.Cells[gcCorrelativo.Index].Value);

                EgresadoDetalleBE nuevo = oEgresado.Detalle.Where(o => o.IdEgresado == id && o.Correlativo == correlativo).FirstOrDefault();

                ActualizarDetalle(nuevo);
            }
        }

        private void btnNuevo1_Click(object sender, EventArgs e)
        {
            NuevoDetalle();
        }

        private void btnActualizar1_Click(object sender, EventArgs e)
        {
            GuardarDetalle();
        }

        private void dgvEgresados_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            try
            {
                if (!IsFormOnEditing && dgvEgresados.CurrentRow != null)
                {
                    CargarEgresado(Convert.ToInt32(dgvEgresados.CurrentRow.Cells[gcIdEgresado.Index].Value));
                }
                tabEgresado.SelectTab(tpgRegistrar);
                EstadoFormulario = EstadoForm.Navegando;
            }
            catch (Exception ex)
            {
                MessageBox.Show("No se pudo cargar los datos correctamente." + Environment.NewLine + ex.ToString(), "Advertencia", MessageBoxButtons.OK, MessageBoxIcon.Exclamation);
            }

        }

        private void btnModificar1_Click(object sender, EventArgs e)
        {
            ModificarDetalle();
        }

        private void btnCancelar1_Click(object sender, EventArgs e)
        {
            btnGuardar.Enabled = true;
            btnCancelar.Enabled = true;

            txtEmpresa.Text = oEgresadoDetalle.Empresa;
            txtPuesto.Text = oEgresadoDetalle.Puesto;
            txtArea.Text = oEgresadoDetalle.Area;
            try
            {
                dtpInicioLab.Value = oEgresadoDetalle.InicioLaboral;
            }
            catch (Exception)
            {
                dtpInicioLab.Value = DateTime.Now;
            }
            try
            {
                dtpFinLab.Value = oEgresadoDetalle.FinLaboral;
            }
            catch (Exception)
            {
                dtpFinLab.Value = DateTime.Now;
            }
            txtDescripTarea.Text = oEgresadoDetalle.DescripcionTarea;

            EstadoDetalle = EstadoForm.Navegando;
        }



        private void txtAnoEgreso_KeyPress(object sender, KeyPressEventArgs e)
        {
            SoloNumeros(e);
        }

        private void txtDNIBus_KeyPress(object sender, KeyPressEventArgs e)
        {
            SoloNumeros(e);
        }

        private void txtAnoEgresoBus_KeyPress(object sender, KeyPressEventArgs e)
        {
            SoloNumeros(e);
        }

        private void txtDNI_KeyPress(object sender, KeyPressEventArgs e)
        {
            SoloNumeros(e);
        }
        #endregion        
    }
}
