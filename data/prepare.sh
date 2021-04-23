aishell_data=/exdata/HOME/snie/code/v1_speaker_asvspoof/dataset_min/speaker/speech/

## make dataset
featdir=fbank/
for x in train dev test; do
    python3 aishell_data_prep.py  $aishell_data/$x data/$x $featdir/$x || exit 1;
done
## make test_pair for verification
for x in dev test; do
    python3 make_pairs.py data/$x 1500 1500 || exit 1;
done