from collections import deque

graph = {
    "Borivali": ["Kandivali", "Dahisar"],
    "Kandivali": ["Malad", "Goregaon"],
    "Dahisar": ["Mira Road"],
    "Malad": ["Jogeshwari"],
    "Goregaon": ["Andheri"],
    "Mira Road": ["Bandra"],
    "Jogeshwari": ["Bandra"],
    "Andheri": ["Dadar West"],
    "Bandra": ["Dadar Station"],
    "Dadar West": ["Dadar Station"],
    "Dadar Station": []
}

def bfs(graph, start, goal):
    visited = set()
    queue = deque([(start, [start])])

    print("BFS Traversal:\n")

    while queue:
        node, path = queue.popleft()

        if node not in visited:
            print(node)
            visited.add(node)

            if node == goal:
                print("\nShortest Path:")
                print(" -> ".join(path))
                return

            for neighbor in graph[node]:
                if neighbor not in visited:
                    queue.append((neighbor, path + [neighbor]))

source = "Borivali"
destination = "Dadar Station"

print("Source:", source)
print("Destination:", destination)
print("-" * 40)

bfs(graph, source, destination)

# Iterative Depth First Search (DFS)

graph = {
    "Borivali": ["Kandivali", "Dahisar"],
    "Kandivali": ["Malad", "Goregaon"],
    "Dahisar": ["Mira Road"],
    "Malad": ["Jogeshwari"],
    "Goregaon": ["Andheri"],
    "Mira Road": ["Bandra"],
    "Jogeshwari": ["Bandra"],
    "Andheri": ["Dadar West"],
    "Bandra": ["Dadar Station"],
    "Dadar West": ["Dadar Station"],
    "Dadar Station": []
}

def iterative_dfs(graph, start, goal):
    visited = set()
    stack = [(start, [start])]

    print("DFS Traversal:\n")

    while stack:
        node, path = stack.pop()

        if node not in visited:
            print(node)
            visited.add(node)

            if node == goal:
                print("\nPath Found:")
                print(" -> ".join(path))
                return

            # Push neighbors in reverse order so the left branch is explored first
            for neighbor in reversed(graph[node]):
                if neighbor not in visited:
                    stack.append((neighbor, path + [neighbor]))

source = "Borivali"
destination = "Dadar Station"

print("Source      :", source)
print("Destination :", destination)
print("-" * 40)

iterative_dfs(graph, source, destination)

import time
from collections import deque

graph = {
    "Borivali": ["Kandivali", "Dahisar"],
    "Kandivali": ["Malad", "Goregaon"],
    "Dahisar": ["Mira Road"],
    "Malad": ["Jogeshwari"],
    "Goregaon": ["Andheri"],
    "Mira Road": ["Bandra"],
    "Jogeshwari": ["Bandra"],
    "Andheri": ["Dadar West"],
    "Bandra": ["Dadar Station"],
    "Dadar West": ["Dadar Station"],
    "Dadar Station": []
}

# BFS
def bfs(graph, start, goal):
    visited = set()
    queue = deque([(start, [start])])

    while queue:
        node, path = queue.popleft()

        if node not in visited:
            visited.add(node)

            if node == goal:
                return path

            for neighbor in graph[node]:
                if neighbor not in visited:
                    queue.append((neighbor, path + [neighbor]))

# DFS (Iterative)
def dfs(graph, start, goal):
    visited = set()
    stack = [(start, [start])]

    while stack:
        node, path = stack.pop()

        if node not in visited:
            visited.add(node)

            if node == goal:
                return path

            for neighbor in reversed(graph[node]):
                if neighbor not in visited:
                    stack.append((neighbor, path + [neighbor]))

# Measure BFS time
start_time = time.time()
bfs_path = bfs(graph, "Borivali", "Dadar Station")
bfs_time = time.time() - start_time

# Measure DFS time
start_time = time.time()
dfs_path = dfs(graph, "Borivali", "Dadar Station")
dfs_time = time.time() - start_time

print("===== BFS vs DFS Comparison =====\n")

print("BFS Path:", " -> ".join(bfs_path))
print("DFS Path:", " -> ".join(dfs_path))

print("\nExecution Time:")
print("BFS Time:", bfs_time)
print("DFS Time:", dfs_time)

print("\nConclusion:")
print("BFS gives shortest path, DFS may not but uses less memory.")