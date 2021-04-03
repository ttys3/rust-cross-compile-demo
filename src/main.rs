use git2::Repository;

fn main() {
    let repo = match Repository::init("/tmp/hello.git") {
        Ok(repo) => repo,
        Err(e) => panic!("failed to init: {}", e),
    };

    println!("success init repo");
}
