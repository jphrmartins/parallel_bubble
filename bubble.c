// bubble_sort.c (Roland Teodorowitsch; 15 set. 2022)

#include <stdio.h>
#include <omp.h>

#define MAX_ARRAY_SIZE 25000
#define INI_ARRAY_SIZE 2500
#define INC_ARRAY_SIZE 2500

// ESTRUTURA DE DADOS COMPARTILHADA
int arrays[NUM_ARRAYS][MAX_ARRAY_SIZE];

// BUBBLE SORT
void BubbleSort(int n, int * vetor) {
  int c =0, d, troca, trocou =1;

  while (c < (n-1) && trocou ) {
    trocou = 0;
    for (d = 0 ; d < n - c - 1; d++)
      if (vetor[d] > vetor[d+1]) {
        troca      = vetor[d];
        vetor[d]   = vetor[d+1];
        vetor[d+1] = troca;
        trocou = 1;
      }
    c++;
  }
}

void clean(int * array, size_t size) {
  for (size_t i = 0; i < size; i++) {
    array[i] = 0;
  }
}

struct SizeTime
{
  int size;
  double time;
};


int main() {
  int i, j, array_size, array_loop;
  double tempo;
  struct SizeTime sizes_with_time[10];
  int thread_activation[NUM_THREADS];
  

  for (array_size = INI_ARRAY_SIZE, array_loop=0; array_size <= MAX_ARRAY_SIZE; array_size += INC_ARRAY_SIZE, array_loop++) {
    printf("\n-------\n");
      // INICIALIZA OS ARRAYS A SEREM ORDENADOS
    #pragma omp parallel for private(j) num_threads(omp_get_num_procs())
    for (i=0 ; i<NUM_ARRAYS; i++) {
      for (j=0 ; j<array_size; j++) {
        if (i%5 == 0)
          arrays[i][j] = array_size-j;
        else
          arrays[i][j] = j+1;
      }
    }
    printf("Will start sorting with arrays with size: %d\n", array_size);

    clean(thread_activation, sizeof thread_activation);
      // REALIZA A ORDENACAO
    tempo = -omp_get_wtime(); 
    printf("Tempo: %lf, array: %d\n", tempo, array_size);
    #pragma omp parallel for schedule(SCHEDULER_PROCESS, CHUNCK_SIZE) num_threads(NUM_THREADS)
    for (i=0 ; i<NUM_ARRAYS; i++) {    
      printf("Thread %d (of %d) will sort array %d\n", omp_get_thread_num(), omp_get_num_threads(), i);
      BubbleSort(array_size, &arrays[i][0]);
      thread_activation[omp_get_thread_num()] = thread_activation[omp_get_thread_num()] + 1;
    }
    tempo += omp_get_wtime();
    printf("Tempo: %lf, array: %d\n", tempo, array_size);

    // VERIFICA SE OS ARRAYS ESTAO ORDENADOS
    for (i=0 ; i<NUM_ARRAYS; i++)
      for (j=0 ; j<array_size-1; j++)
        if (arrays[i][j] > arrays[i][j+1])
          return 1;
      // MOSTRA O TEMPO DE EXECUCAO

    sizes_with_time[array_loop].size = array_size;
    sizes_with_time[array_loop].time = tempo;
    printf("\n");
    printf("INSERIU?: %d -> %lf", sizes_with_time[array_loop].time, sizes_with_time[array_loop].size);
    for (i = 0; i < NUM_THREADS; i++){
      printf("thread %d, executed: %d\n", i, thread_activation[i]);
    }
  }

  printf("\n\n\n");
  printf("number of arrays: %d\n", NUM_ARRAYS);
  printf("size,time\n");
  for (i = 0; i < 10; i++) {
    printf("%d,%lf\n",sizes_with_time[i].size, sizes_with_time[i].time);
  }

  return 0;
}
