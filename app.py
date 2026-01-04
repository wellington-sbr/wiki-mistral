import streamlit as st
import ollama

st.set_page_config(page_title="Generador de Documentación con Mistral")

st.title("📄 Generador de Documentación Automática")
st.write("Sube un archivo Python y genera documentación usando IA open-source (Mistral).")

uploaded_file = st.file_uploader("Sube un archivo .py", type=["py"])

if uploaded_file:
    code = uploaded_file.read().decode("utf-8")

    prompt = f"""
Eres un asistente experto en ingeniería de software.

A partir del siguiente código en Python:

{code}

Genera:
1. Un README.md corto explicando el proyecto
2. Descripción de las clases y funciones
3. Comentarios que podrían agregarse al código

Responde de forma clara y estructurada.
"""

    if st.button("Generar documentación"):
        with st.spinner("Generando documentación con Mistral..."):
            response = ollama.chat(
                model="mistral",
                messages=[{"role": "user", "content": prompt}]
            )

        st.subheader("📘 Documentación generada")
        st.markdown(response["message"]["content"])
