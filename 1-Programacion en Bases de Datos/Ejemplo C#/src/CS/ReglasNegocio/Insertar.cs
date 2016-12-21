using System;
using System.Collections.Generic;
using System.Text;

using DCE05.Ejemplos.EstrellaUno.AccesoDatos;

namespace DCE05.Ejemplos.EstrellaUno.ReglasNegocio
{
    public class Insertar
    {
        public void InsertarUsuario(string nu, int ch){

            String sql = "INSERT INTO Usuarios (NombreUsuario, ContraseñaUsuario) VALUES ('" + nu + "', '" + ch + "')";
            BaseDatos db = new BaseDatos();
            db.Conectar();
            db.CrearComando(sql);
            db.EjecutarComando();
            db.Desconectar();
        }
    }
}
