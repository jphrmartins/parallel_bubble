generate:
	mkdir -p static/
	mkdir -p dynamic/
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=2 -DNUM_ARRAYS=25 bubble.c -o dynamic/bubble_dynamic_2_25 -fopenmp
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=4 -DNUM_ARRAYS=25 bubble.c -o dynamic/bubble_dynamic_4_25 -fopenmp
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=8 -DNUM_ARRAYS=25 bubble.c -o dynamic/bubble_dynamic_8_25 -fopenmp
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=16 -DNUM_ARRAYS=25 bubble.c -o dynamic/bubble_dynamic_16_25 -fopenmp

	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=2 -DNUM_ARRAYS=150 bubble.c -o dynamic/bubble_dynamic_2_150 -fopenmp
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=4 -DNUM_ARRAYS=150 bubble.c -o dynamic/bubble_dynamic_4_150 -fopenmp
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=8 -DNUM_ARRAYS=150 bubble.c -o dynamic/bubble_dynamic_8_150 -fopenmp
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=16 -DNUM_ARRAYS=150 bubble.c -o dynamic/bubble_dynamic_16_150 -fopenmp

	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=2 -DNUM_ARRAYS=500 bubble.c -o dynamic/bubble_dynamic_2_500 -fopenmp
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=4 -DNUM_ARRAYS=500 bubble.c -o dynamic/bubble_dynamic_4_500 -fopenmp
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=8 -DNUM_ARRAYS=500 bubble.c -o dynamic/bubble_dynamic_8_500 -fopenmp
	gcc -DSCHEDULER_PROCESS=dynamic -DCHUNCK_SIZE=5 -DNUM_THREADS=16 -DNUM_ARRAYS=500 bubble.c -o dynamic/bubble_dynamic_16_500 -fopenmp

	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=2 -DNUM_ARRAYS=25 bubble.c -o static/bubble_static_2_25 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=4 -DNUM_ARRAYS=25 bubble.c -o static/bubble_static_4_25 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=8 -DNUM_ARRAYS=25 bubble.c -o static/bubble_static_8_25 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=16 -DNUM_ARRAYS=25 bubble.c -o static/bubble_static_16_25 -fopenmp

	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=2 -DNUM_ARRAYS=150 bubble.c -o static/bubble_static_2_150 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=4 -DNUM_ARRAYS=150 bubble.c -o static/bubble_static_4_150 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=8 -DNUM_ARRAYS=150 bubble.c -o static/bubble_static_8_150 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=16 -DNUM_ARRAYS=150 bubble.c -o static/bubble_static_16_150 -fopenmp

	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=2 -DNUM_ARRAYS=500 bubble.c -o static/bubble_static_2_500 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=4 -DNUM_ARRAYS=500 bubble.c -o static/bubble_static_4_500 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=8 -DNUM_ARRAYS=500 bubble.c -o static/bubble_static_8_500 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=5 -DNUM_THREADS=16 -DNUM_ARRAYS=500 bubble.c -o static/bubble_static_16_500 -fopenmp

	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=1 -DNUM_THREADS=1 -DNUM_ARRAYS=25 bubble.c -o seq/bubble_seq_25 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=1 -DNUM_THREADS=1 -DNUM_ARRAYS=150 bubble.c -o seq/bubble_seq_150 -fopenmp
	gcc -DSCHEDULER_PROCESS=static -DCHUNCK_SIZE=1 -DNUM_THREADS=1 -DNUM_ARRAYS=500 bubble.c -o seq/bubble_seq_500 -fopenmp

clean:
	rm ./static/bubble_static_*
	rm ./dynamic/bubble_dynamic_*
	rm ./seq/bubble_dynamic_*