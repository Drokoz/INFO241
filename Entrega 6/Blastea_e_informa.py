import sys
from Bio.Seq import Seq
from Bio import Entrez
from Bio import SeqIO
from Bio.Blast import NCBIWWW
from Bio.Blast import NCBIXML

def get_Evalue(e):
  return e.hsps[0].expect
def main(argv):
    # if len(argv) < 2:
    #     print("Debe ingresar como argumento una cadena")
    # chain = argv[1]
    # secuencia = Seq(chain)
    # result_handle = NCBIWWW.qblast("blastn", "nt", secuencia)
    # with open("resultado_blast.xml", "w") as out_handle:
    #     out_handle.write(result_handle.read())
    # result_handle.close()
    # print('archivo almacenado')
    resultados = open("resultado_blast.xml")
    blast_record = NCBIXML.read(resultados)
    print(blast_record)
    resultados.close()
    # variables para limitar visualización
    hits_mostrados = 0
    hsps_mostrados = 0
    max_hits_a_mostrar = 5
    max_hsps_a_mostrar = 6
    print(blast_record.alignments[0].max_hsps)
    sorted_Aligments = blast_record.alignments.sort(key=get_Evalue)
    print(sorted_Aligments[0].max_hsps)
    # print(type(blast_record.alignments[0]))
    # for alineamiento in blast_record.alignments:  # alignments se refiere a los hits
    #     i = 0
    #     for hsp in alineamiento.hsps: # recore HSPs
    #         print(i)
    #         i += 1
    #         print(f'=== Alineamiento  (Hit:{hits_mostrados} HSP:{hsps_mostrados}) ===================')
    #         print(f' Secuencia: {alineamiento.title}') # title concatena tags hit_id y hit_def
    #         print(f' Largo: {alineamiento.length}') # se refiere al tag hit_len
    #         print(f' e value: {hsp.expect}') # se refiere al tag Hsp_evalue

    #         # lo siguiente es solo para limitar la cantidad de registros mostrados
    #         hsps_mostrados += 1
    #         if hsps_mostrados >= max_hsps_a_mostrar:
    #             hsps_mostrados = 0
    #             break
    #     hits_mostrados += 1
    #     if hits_mostrados >= max_hits_a_mostrar:
    #         break

if __name__ == "__main__":
    main(sys.argv)