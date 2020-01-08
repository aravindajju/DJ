using System;

using Microsoft.Quantum.Simulation.Core;
using Microsoft.Quantum.Simulation.Simulators;

namespace QuantumMasterClass
{

    class Driver
    {
        static void Main(string[] args)
        {
            using (var qsim = new QuantumSimulator())
            {
                HelloQ.Run(qsim).Wait();
                Console.WriteLine("-----------------------------------------");

                RandomNumberGenerator.Run(qsim).Wait();
                Console.WriteLine("-----------------------------------------");
               
                BitAdder.Run(qsim).Wait();
                Console.WriteLine("-----------------------------------------");

                FullBitAdder.Run(qsim).Wait();
                Console.WriteLine("-----------------------------------------");

                QuantumSwapGate.Run(qsim).Wait();

            }
        }
    }
}