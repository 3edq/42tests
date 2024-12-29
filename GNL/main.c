
#include "get_next_line.h"
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>

void	test_get_next_line(const char *file_path)
{
	int		fd;
	char	*line;

	fd = open(file_path, O_RDONLY);
	if (fd == -1)
	{
		perror("Error opening file");
		return ;
	}
	printf("\n--- Testing file: %s ---\n", file_path);
	while ((line = get_next_line(fd)) != NULL)
	{
		printf("%s", line);
		free(line);
	}
	close(fd);
}

void	test_standard_input(void)
{
	char	*line;

	printf("\n--- Testing standard input (Enter text, Ctrl+D to end): ---\n");
	while ((line = get_next_line(STDIN_FILENO)) != NULL)
	{
		printf("%s", line);
		free(line);
	}
}

int	main(void)
{
	test_get_next_line("multi_line.txt");
	test_get_next_line("no_newline_at_end.txt");
	test_get_next_line("empty_file.txt");
	test_get_next_line("single_line.txt");
	test_get_next_line("only_newlines.txt");
	test_get_next_line("large_file.txt");
	test_get_next_line("unicode_characters.txt");
	test_standard_input();
	return (0);
}
