import numpy as np
import pandas as pd

def remove_duplicates(df: pd.DataFrame) -> pd.DataFrame:
  return df.drop_duplicates()

def remove_outliers(df: pd.DataFrame) -> pd.DataFrame:
  return

def handle_missing_values(df: pd.DataFrame) -> pd.DataFrame:
  return

def standardize_formats(df: pd.DataFrame) -> pd.DataFrame:
  df.columns = [col.strip().lower().replace(' ', '_') for col in df.columns]
  return
