import os
import shutil
import subprocess

RAYLIB_REPO = 'https://github.com/raysan5/raylib.git'
RAYGUI_REPO = 'https://github.com/raysan5/raygui.git'

NATIVE_DIR = os.path.join(os.getcwd(), "native")
RAYLIB_DIR = os.path.join(NATIVE_DIR, "raylib")
RAYGUI_DIR = os.path.join(NATIVE_DIR, "raygui")
BUILD_DIR = os.path.join(NATIVE_DIR, "build")

def run(cmd, cwd=None):
    print(">>", " ".join(cmd))
    subprocess.check_call(cmd, cwd=cwd, shell=True)

def clone_repo(repo_url, dest_dir):
    if os.path.exists(dest_dir):
        print(f"{dest_dir} уже существует, пропускаю clone")
    else:
        print(f"Cloning {repo_url} to {dest_dir}")
        subprocess.check_call(["git", "clone", repo_url, dest_dir])

def prepare_build():
    if os.path.exists(BUILD_DIR):
        shutil.rmtree(BUILD_DIR)
    os.makedirs(BUILD_DIR)

    shutil.copytree(os.path.join(RAYLIB_DIR, "src"), BUILD_DIR, dirs_exist_ok=True)

    shutil.copy(os.path.join(RAYGUI_DIR, "src", "raygui.h"), BUILD_DIR)

    raygui_c_path = os.path.join(BUILD_DIR, "raygui.c")
    with open(raygui_c_path, "w", encoding="utf-8") as f:
        f.write('#define RAYGUI_IMPLEMENTATION\n')
        f.write('#include "raygui.h"\n')
    print("Создан:", raygui_c_path)

def build_dll():
    os.chdir(BUILD_DIR)
    cmd = [
        "gcc", "-shared", "-o", "raylib_raygui.dll",
        "rcore.c", "rshapes.c", "rtextures.c", "rtext.c",
        "rmodels.c", "raudio.c", "utils.c", "rglfw.c",
        "raygui.c",
        "-I.", "-Iexternal", "-Iexternal/glfw/include",
        "-DPLATFORM_DESKTOP", "-DGRAPHICS_API_OPENGL_33",
        "-lopengl32", "-lgdi32", "-lwinmm", "-static-libgcc",
        "-Wl,--export-all-symbols"
    ]
    run(cmd)

if __name__ == "__main__":
    if not os.path.exists(NATIVE_DIR):
        os.makedirs(NATIVE_DIR)
    clone_repo(RAYLIB_REPO, RAYLIB_DIR)
    clone_repo(RAYGUI_REPO, RAYGUI_DIR)

    prepare_build()
    build_dll()
