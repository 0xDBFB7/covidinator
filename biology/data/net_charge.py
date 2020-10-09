from localcider.sequenceParameters import SequenceParameters
import glob
#

# NOTE: Where pH values can be provided, if left blank we assume a neutral pH where only R/K/D/E are charged. If a pH value is provided, then R/K/D/E/C/Y/H are all considered titratable residues using EMBOSS pKa values, listed below: ‘C’: 8.5, ‘Y’: 10.1, ‘H’: 6.5, ‘E’: 4.1, ‘D’: 3.9, ‘K’: 10.0, ‘R’: 12.5

files = glob.glob('protein_sequences/*.*')
for file in files:
    print(file)
    contents = open(file).read().split('>')
    #can't use SeqParam(seqfile=file)
    #because all the sequences are appended to each other.
    output = open(file + "_charge", 'w+')
    for protein in [x for x in contents if x]:

        header = protein[0:protein.index('\n')]
        seq = protein[protein.index('\n'):-1]

        print(header)
        if('X' in seq):
            print("Warning: unspecified protein encountered.")
        seq = seq.replace('X', '')


        seq_param = SequenceParameters(seq)

        #mean_net_charge is always positive, whereas
        # net_charge_per_residue is alternating
        net_charge = seq_param.get_NCPR(pH=7.0)*seq_param.get_length()
        print(net_charge)

        output.write(header)
        output.write(", ")
        output.write(str(7.0))
        output.write(str(", "))
        output.write(str(net_charge))
        output.write('\n')


    output.close()
