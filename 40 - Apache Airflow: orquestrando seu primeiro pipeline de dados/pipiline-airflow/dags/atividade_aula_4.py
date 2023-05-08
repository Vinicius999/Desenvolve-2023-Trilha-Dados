from airflow.models import DAG
from airflow.utils.dates import days_ago
from airflow.operators.python_operator import PythonOperator


with DAG(
    'atividade_aula_4',
    start_date=days_ago(1),
    schedule_interval='@daily'
) as dag:
    
    def cumprimentos():
        print("Boas-vindas ao Airflow!")
    
    tarefa = PythonOperator(
        task_id = 'tarefa',
        python_callable=cumprimentos
    )