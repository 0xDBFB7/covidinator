
import elabapy
import datetime

manager = elabapy.Manager(endpoint="https://127.0.0.1/api/v1/",
        token="e7bcd146e669745f3918ffde74a7b38910962121a6e67308b71790823ffe2d58beab48e7f2912b05af26", verify=False)

def ask(filenames, body=""):
    if(input("Would you like to record this run? [y/N]: ") == 'y'):
        title = input("Enter a title: ")
        make(filenames, title, body)

def make(filenames, title, body):
    response = manager.create_experiment()
    id = int(response['id'])
    print(f"Created experiment with id {id}.")

    params = { "title": title, "date": datetime.datetime.today().strftime("%Y%m%d"), "body": body}
    manager.post_experiment(id, params)

    for filename in filenames:
        with open(filename, 'rb') as myfile:
            manager.upload_to_experiment(id, { 'file': myfile })
