import MDAnalysis as mda
from MDAnalysis.topology.guessers import guess_types
import prolif as plf
import pandas as pd
import matplotlib.pyplot as plt
from prolif.plotting.barcode import Barcode
#import matplotlib.pyplot as plt

print("load topology and trajectory")

u = mda.Universe("md_ACE1_pep1.pdb","md_ACE1_pep_nojump.xtc")
#u.add_TopologyAttr('elements', guess_types(u.atoms.names))

print("create selections for both protein components")
small_protein_selection = u.select_atoms("chainID B")
large_protein_selection = u.select_atoms("protein and byres around 20.0 group peptide", peptide=small_protein_selection)
small_protein_selection, large_protein_selection
small_protein_selection.guess_bonds()
large_protein_selection.guess_bonds()

print("create a molecule from the MDAnalysis selection")
small_protein_mol = plf.Molecule.from_mda(small_protein_selection)
large_protein_mol = plf.Molecule.from_mda(large_protein_selection)

fp = plf.Fingerprint(["HBDonor","HBAcceptor","PiStacking","PiCation","CationPi","Anionic","Cationic","Hydrophobic"])
fp.run(u.trajectory, small_protein_selection, large_protein_selection)

# Convert to DataFrame
df = fp.to_dataframe()

# Write DataFrame to a CSV file
df.to_csv("fingerprint_data-Complex.csv", index=False)
print("Fingerprint data saved to fingerprint_data.csv")

# === Calcular frequências ===
frequencies = df.mean()
frequent_contacts = frequencies[frequencies > 0.5]

# === Filtrar DataFrame ===
df_filtered = df[frequent_contacts.index]

# === Criar e mostrar Barcode ===
barcode = Barcode(df_filtered)
ax = barcode.display(figsize=(12, 8), dpi=600)
plt.savefig("barcode_filtered.png", bbox_inches='tight')
#print("Filtered barcode saved to barcode_filtered.png")
# Plot and save the barcode
#plt.figure()  # Create a new figure to avoid overlaps
# Filtrar contatos com frequência maior que 0.5
#filtered_contacts = fp.contacts[fp.contacts['frequency'] > 0.5]
# Filtrar contatos com frequência maior que 0.5 a partir do DataFrame
#filtered_contacts = df[df['frequency'] > 0.5]
# Plotar apenas os contatos filtrados
#prolif.plot.plot_barcode(filtered_contacts)
#fp.plot_barcode()
#plt.savefig("fingerprint_barcode-complex.png", dpi=600, bbox_inches='tight')  # Save the plot as PNG
#print("Barcode plot saved to fingerprint_barcode.png")
