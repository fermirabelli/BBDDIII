using System;
using System.Collections.Generic;
using System.Text;
using System.Data.Common;
using System.Data;

using DCE05.Ejemplos.EstrellaUno.ReglasNegocio;

namespace DCE05.Ejemplos.EstrellaUno.Cliente {
    class OpcionCrearUsuario : Opcion {
        internal OpcionCrearUsuario(int codigo) {
            Codigo = codigo;
            Descripcion = "Crear Usuario";
        }

        internal OpcionCrearUsuario() : this(0) {
        }

        internal override void EjecutarAccion() {
            String nombreUsuario;
            String contraseñaUsuario = "";
            String contraseñaUsuario2 = "";

            Console.WriteLine("Por favor, ingrese su nombre de usuario:");
            nombreUsuario = Console.ReadLine();

            Console.WriteLine("Por favor, ingrese su contraseña:");
            contraseñaUsuario = Console.ReadLine();
            ///LO COMENTADO A CONTINUACION ES PARA ESCRIBIR * EN LA CONTRASEÑA, PERO NO SIRVE
            ///PORQUE TOMA LA TECLA DELETE COMO OTRO CARACTER
            ///bool i = true;
            ///ConsoleKeyInfo c;
            ///while (i) {
            ///    c = Console.ReadKey(true);
            ///    if (c.KeyChar != '\r')
            ///        contraseñaUsuario = contraseñaUsuario + c.KeyChar;
            ///    else
            ///        i = false;
            ///    Console.Write("*");
            ///}

            Console.WriteLine("\rConfirme su contraseña:");
            contraseñaUsuario2 = Console.ReadLine();
            ///IDEM
            /// i = true;
            ///while (i)
            ///{
            ///    c = Console.ReadKey(true);
            ///    if (c.KeyChar != '\r')
            ///        contraseñaUsuario2 = contraseñaUsuario2 + c.KeyChar;
            ///    else
            ///        i = false;
            ///  Console.Write("*");
            ///}

            while (!Equals(contraseñaUsuario, contraseñaUsuario2)) {
                Console.WriteLine("\rDebe confirmar correctamente su contraseña...");
                Console.WriteLine("Por favor, ingrese su contraseña:");
                contraseñaUsuario = Console.ReadLine();

                Console.WriteLine("\rConfirme su contraseña:");
                contraseñaUsuario2 = Console.ReadLine();
            }

            int contraseñaHasheada = contraseñaUsuario.GetHashCode();

            Insertar insercion = new Insertar();
            insercion.InsertarUsuario(nombreUsuario, contraseñaHasheada);

        }
    }
}
