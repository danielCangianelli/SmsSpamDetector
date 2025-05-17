import pandas as pd

# Carregar o dataset (ajuste o caminho do arquivo)
df = pd.read_csv('spam.csv', encoding='latin-1')

# Selecionar apenas as colunas relevantes (v1 = label, v2 = texto)
df = df[['v1', 'v2']]

# Renomear colunas
df.columns = ['label', 'text']

# Salvar o CSV processado
df.to_csv('spam_processed.csv', index=False)

from sklearn.model_selection import train_test_split

# Carregar o CSV processado
df = pd.read_csv('spam_processed.csv')

# Dividir em 80% treino, 20% teste
train_df, test_df = train_test_split(df, test_size=0.2, random_state=42)

# Salvar
train_df.to_csv('train.csv', index=False)
test_df.to_csv('test.csv', index=False)