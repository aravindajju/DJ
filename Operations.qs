namespace QuantumMasterClass
{
    open Microsoft.Quantum.Canon;
    open Microsoft.Quantum.Intrinsic;

    operation HelloQ () : Unit {
        Message("Hello quantum world!");
    }

    operation BitAdder() : Unit {

        mutable r = new Result[4];

        using((a,b,c) = (Qubit(),Qubit(),Qubit()))  { // Allocate qubits
            //set up initial values for Qubit
            X(a);
            X(b);
            set r = [M(a), M(b)];
            Message($"a,b : {r}");

            CCNOT(a, b, c);
            CNOT(a, b);
            
            let carrybit = M(c);
            let sumbit= M(b);
            Message($"Sum : {carrybit} {sumbit}");
            Reset(a);
            Reset(b);
            Reset(c);
        }

    }


    operation FullBitAdder() : Unit {

        mutable r = new Result[4];

        using((a,b,c,d) = (Qubit(),Qubit(),Qubit(),Qubit()))  { // Allocate qubits
            //set up initial values for Qubit
            X(a);
            //X(b);
            X(c);

            set r = [M(a), M(b),M(c)];
            Message($"a,b,c : {r}");

            CCNOT(a, b, c);
            CNOT(a, b);
            CCNOT(b, c, d);
            CNOT(b, c);
            CNOT(a, b);
            
            let carrybit = M(d);
            let sumbit= M(c);
            Message($"Sum : {carrybit} {sumbit}");
            Reset(a);
            Reset(b);
            Reset(c);
            Reset(d);

        }

    }


    operation RandomNumberGenerator() : Unit {
        mutable r = new Result[5];
        using(q = Qubit[5])  {

            for (qindex in 0 .. 4)
            {
                H(q[qindex]);             // Put the qubits to superposition. It now has a 50% chance of being 0 or 1.
            }

            set r = [M(q[0]), M(q[1]), M(q[2]), M(q[3]), M(q[4])];
            
            Message($"Random Number: {r}");
            for (qindex in 0 .. 4)
            {
                Reset(q[qindex]);
            }

        }
    }

//*****************************************************************************
// Swap quantum bit states between two quantum registers, without using any additional register.
//*****************************************************************************

    operation QuantumSwapGate() : Unit {
        mutable r = new Result[2];
        using((qA,qB) = (Qubit(),Qubit()))  { // Allocate Qubits
        
            //Initialize Qubits
            X(qA);
            //X(qB);

            Message("Before swap: qA and qB: [One, Zero]");

            //In Boolean this would have been done using XOR the following way:
            //Two bits a, b;
            //a = a XOR b;
            //b = b XOR a;
            //a = a XOR b;
            //Value of a and b are swapped 

            CNOT(qA, qB);
            CNOT(qB, qA);
            CNOT(qA, qB);

            set r = [M(qA), M(qB)];

            Message($"After swap: qA and qB: {r}");
            Reset(qA);
            Reset(qB);

        }
     }



}
