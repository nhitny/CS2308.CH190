export CUDA_VISIBLE_DEVICES=3
export LD_PRELOAD=$CONDA_PREFIX/lib/libstdc++.so.6
export LD_LIBRARY_PATH=$CONDA_PREFIX/lib:$LD_LIBRARY_PATH
source ../config.env.sh
bs=8
lr=2e-4
dropout=0.1
psl=8
epoch=40


A=am
B=dz
C=ha
D=ig
E=kr
F=ma
G=pcm
H=pt
I=sw
J=ts
K=twi
L=yo
for seed in 0 1 2
    do
        task_order=${A}_${B}_${C}_${D}_${E}_${F}_${G}_${H}_${I}_${J}_${K}_${L}
        python3 $path1 \
            --dataset_path /workspace/nhitny/mcs/nlp/MoCL-NAACL-2024/datasets/afrisenti \
            --model_name_or_path Davlan/afro-xlmr-large \
            --cl_language_list $task_order \
            --continual_learning \
            --compose_prompts \
            --task_specific_classifier \
            --matching_loss_v2 \
            --do_train \
            --do_eval \
            --do_predict \
            --early_stop \
            --early_stopping_patience 5 \
            --max_seq_length 128 \
            --per_device_train_batch_size $bs \
            --learning_rate $lr \
            --num_train_epochs $epoch \
            --pre_seq_len $psl \
            --output_dir checkpoints_continual_afrisenti/order1_E2_compose_prompt \
            --overwrite_output_dir \
            --hidden_dropout_prob $dropout \
            --seed $seed \
            --save_strategy epoch \
            --evaluation_strategy epoch \
            --prefix

        
        task_order=${F}_${G}_${E}_${H}_${D}_${I}_${C}_${J}_${B}_${K}_${A}_${L}
        python3 $path1 \
            --dataset_path /workspace/nhitny/mcs/nlp/MoCL-NAACL-2024/datasets/afrisenti \
            --model_name_or_path Davlan/afro-xlmr-large \
            --cl_language_list $task_order \
            --continual_learning \
            --compose_prompts \
            --task_specific_classifier \
            --matching_loss_v2 \
            --do_train \
            --do_eval \
            --do_predict \
            --early_stop \
            --early_stopping_patience 5 \
            --max_seq_length 128 \
            --per_device_train_batch_size $bs \
            --learning_rate $lr \
            --num_train_epochs $epoch \
            --pre_seq_len $psl \
            --output_dir checkpoints_continual_afrisenti/order2_E2_compose_prompt \
            --overwrite_output_dir \
            --hidden_dropout_prob $dropout \
            --seed $seed \
            --save_strategy epoch \
            --evaluation_strategy epoch \
            --prefix


        task_order=${A}_${B}_${C}_${F}_${D}_${E}_${I}_${J}_${K}_${L}_${G}_${H}
        python3 $path1 \
            --dataset_path /workspace/nhitny/mcs/nlp/MoCL-NAACL-2024/datasets/afrisenti \
            --model_name_or_path Davlan/afro-xlmr-large \
            --cl_language_list $task_order \
            --continual_learning \
            --compose_prompts \
            --task_specific_classifier \
            --matching_loss_v2 \
            --do_train \
            --do_eval \
            --do_predict \
            --early_stop \
            --early_stopping_patience 5 \
            --max_seq_length 128 \
            --per_device_train_batch_size $bs \
            --learning_rate $lr \
            --num_train_epochs $epoch \
            --pre_seq_len $psl \
            --output_dir checkpoints_continual_afrisenti/order3_E2_compose_prompt \
            --overwrite_output_dir \
            --hidden_dropout_prob $dropout \
            --seed $seed \
            --save_strategy epoch \
            --evaluation_strategy epoch \
            --prefix  
    done
