# Readme

## Frontend

To serve the frontend, we have to build the static `.js` files.

- Enter the frontend source folder:

```sh
cd frontend
```

- Run typescript compilation:

```sh
tsc
```

## Backend

Then to run the backend run the following command:

```sh
uv run flask run
```

The backend hosts both the frontend code at <localhost:5000/index.html> and the api at <localhost:5000/api/get-number>.
