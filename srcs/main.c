/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: gle-moig <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2016/07/21 10:40:16 by gle-moig          #+#    #+#             */
/*   Updated: 2016/07/21 12:47:40 by gle-moig         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "display_file.h"

void	ft_putstr(int file, char *str)
{
	while (*str)
	{
		write(file, str, 1);
		str++;
	}
}

int		ft_cat(int file)
{
	char	buf[2];

	if (file == -1)
		return (-1);
	while (read(file, buf, 1))
	{
		buf[1] = '\0';
		ft_putstr(1, buf);
	}
	close(file);
	return (0);
}

int		error(char *f_name)
{
	ft_putstr(2, "ft_cat: ");
	ft_putstr(2, f_name);
	ft_putstr(2, ": No such file or directory\n");
	return (0);
}

int		main(int ac, char **av)
{
	int		file;
	int		i;

	file = 0;
	if (ac == 1)
	{
		ft_cat(0);
		return (0);
	}
	i = 1;
	while(i < ac)
	{
		if (ft_cat(open(av[i], O_RDONLY)) == -1)
		{
			error(av[i]);
			return (0);
		}
		i++;
	}
	return (0);
}
