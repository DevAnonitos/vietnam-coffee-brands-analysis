import os

import pandas as pd


def get_dataset_path(filename: str) -> str:
    return os.path.join(filename)


def load_dataset(filename: str) -> pd.DataFrame:
    return


def save_dataset(df: pd.DataFrame, filename: str):
    path = get_dataset_path(filename)
    df.to_csv(path, index=False)


def summarize_dataset(df: pd.DataFrame):
    sumary = {
        "shape": df.shape,
        "colums": df.columns.toList(),
        "dtypes": df.dtypes.to_dict(),
        "duplicates": df.duplicated().sum(),
        "missing": df.isnull().sum().to_dict(),
        "description": df.describe(include="all").to_dict(),
        "memory_usage_mb": df.memory_usage(deep=True).sum() / 1024**2,
    }
    return sumary
